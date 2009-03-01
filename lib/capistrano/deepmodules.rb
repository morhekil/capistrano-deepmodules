require 'capistrano/recipes/deploy/scm/git'
require 'capistrano/recipes/deploy/strategy/remote_cache'

unless Capistrano::Configuration.respond_to?(:instance)
  abort "capistrano/deepmodules requires Capistrano 2"
end

module Capistrano
  module Deploy
    
    module SCM
      class Git < Base

        # Simple interface to submodule commands
        def submodule(subcmd)
          "#{command} submodule #{subcmd}"
        end
    
      end
    end


    module Strategy

      class RemoteCache < Remote
        # Executes the SCM command for this strategy and writes the REVISION
        # mark file to each host.
        # We're overriding default deploy! method to inject a call to deep
        # update the nested modules
        def deploy!
          update_repository_cache
          update_submodules(repository_cache)
          copy_repository_cache
        end

        private

          # Inits and updates submodules in the repository at the path given 
          # via the argument, then recursively descends into all found 
          # submodule and updated them and all their down-levels, too
          def update_submodules(dir)
            logger.trace "updating submodule at #{dir}"

            submodules = Array.new
            run("cd #{dir} && #{source.submodule('status')}") do |state, stream, text|
              # parsing the output of "git submodule status" command
              # and collecting paths of all submodules into an array
              submodules += text.split(/\n/).collect do |submodule|
                $~[1] if submodule.rstrip =~ /.\w{40} ([^()]+)($| \(.*\)$)/
              end
            end

            if submodules.size > 0 then
              # init and update submodules if they were found
              scm_run("cd #{dir} && "+
                "#{source.submodule('init')} && "+
                "#{source.submodule('update')} "
              )
              # and descend into them to repeat the process recursively
              submodules.each { |submodule| update_submodules("#{dir}/#{submodule}") }
            end

          end
      end

    end
  end
end
