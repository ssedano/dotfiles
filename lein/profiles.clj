{:user
 {:plugins [[lein-kibit "0.0.8" :exclusions [org.clojure/clojure]]
            [lein-midje "2.0.4"]
            [lein-marginalia "0.7.1"]
            [lein-clojars "0.9.0"]
            [lein-ancient "0.4.4"]
            [lein-newnew "0.3.4"]
            [org.clojure/tools.trace "0.7.6"]]
  :dependencies [[clj-stacktrace "0.2.7"]
                 [spyscope "0.1.3"]
                 [org.clojure/tools.trace "0.7.6" :exclusions [org.clojure/clojure]]
                 [slamhound "1.5.0"]
                 [environ "0.4.0"]]
  :repl-options
  {:init (do
           (println "Running ~/profiles.clj :user :repl-options :init")

           ;; Having to comment these out for now as they trigger
           ;; https://github.com/trptcolin/reply/issues/99 :-(
           ;; (set! *print-length* 10)
           ;; (set! *print-level* 5)

           (use 'clojure.stacktrace)
           ;; Substituting this for the above, as I would like to do,
           ;; for some reason causes ac-nrepl to hang caching JVM
           ;; class names: https://github.com/purcell/ac-nrepl/issues/25
           ;; (require '[clj-stacktrace.repl :refer [pst]])

           (use 'clojure.pprint)
           (use 'clojure.reflect))
   :timeout 90000}
  :injections [(let [orig (ns-resolve (doto 'clojure.stacktrace require)
                                      'print-cause-trace)
                     new (ns-resolve (doto 'clj-stacktrace.repl require)
                                     'pst)]
                 (alter-var-root orig (constantly @new)))
               (require 'spyscope.core)]
  :aliases {"slamhound" ["run" "-m" "slam.hound"]}}}
