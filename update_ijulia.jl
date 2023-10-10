using Pkg, DelimitedFiles
Pkg.add("IJulia")
using IJulia

# List installed kernels
installed_kernels = split(read(`jupyter kernelspec list`, String), "\n")[2:end-1]
kernel_names = String[]
kernel_locations = String[]

for line in installed_kernels
    name, location = split(line)
    push!(kernel_names, name)
    push!(kernel_locations, location)
end

println("")
println("Installed jupyter kernels:")
for (i, name) in enumerate(kernel_names)
    println("[$i] $(name)")
end


# Remove installed kernels
println("")
println("Remove some of the installed kernels? [y/N]")
yn1 = readline()

if yn1 == "y"
    println("Indicate number of the kernels to be removed")
    kernels_to_remove = vec(readdlm(IOBuffer(readline()), Int))

    for n in kernels_to_remove
        run(`jupyter kernelspec remove $(kernel_names[n])`)
    end

end

# show installed kernels after changes
installed_kernels = split(read(`jupyter kernelspec list`, String), "\n")[2:end-1]
kernel_names = String[]
kernel_locations = String[]

for line in installed_kernels
    name, location = split(line)
    push!(kernel_names, name)
    push!(kernel_locations, location)
end

println("")
println("Installed jupyter kernels:")
for (i, name) in enumerate(kernel_names)
    println("[$i] $(name)")
end

# Install additional kernels
println("")
println("Add aditional IJulia jupyter kernels? [y/N]")
yn2 = readline()

if yn2 == "y"
    println("Indicate the number of Julia threads for the kernel")
    println("(To add multiple kernels, indicate the number of threads for each kernel seperated by spaces)")
    kernels_to_add = vec(readdlm(IOBuffer(readline()), Int))

    for t in kernels_to_add
        installkernel("julia-$(VERSION)_$(t)_threads", env=Dict("JULIA_NUM_THREADS"=>"$t"))
    end

end

# show installed kernels after changes
installed_kernels = split(read(`jupyter kernelspec list`, String), "\n")[2:end-1]
kernel_names = String[]
kernel_locations = String[]

for line in installed_kernels
    name, location = split(line)
    push!(kernel_names, name)
    push!(kernel_locations, location)
end

println("")
println("Installed jupyter kernels:")
for (i, name) in enumerate(kernel_names)
    println("[$i] $(name)")
end
