using IJulia
installkernel("julia-$(VERSION)_$(ARGS[1])_threads", env=Dict("JULIA_NUM_THREADS"=>"ARGS[1]"))
