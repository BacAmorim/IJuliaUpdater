# IJuliaUpdater
Simple script to install IJulia kernels after installing/updating Julia (for Linux).

In Linux systems, for ease of use, create an alias in .bashrc to call the script:
```
alias ijuliaup="path/to/julia path/to/script"
```

## Example usage
```

$ ijuliaup
   Resolving package versions...
  No Changes to `~/.julia/environments/v1.9/Project.toml`
  No Changes to `~/.julia/environments/v1.9/Manifest.toml`

Installed kernels:
[1] fssa
[2] julia-1.9
[3] julia-1.9.3_4_threads-1.9
[4] julia-1.9.3_8_threads-1.9
[5] python3

Remove some of the installed kernels? [y/N]
$ y
Indicate number of the kernels to be removed
$ 3 4
Kernel specs to remove:
  julia-1.9.3_4_threads-1.9     /home/bamorim/.local/share/jupyter/kernels/julia-1.9.3_4_threads-1.9
Remove 1 kernel specs [y/N]: y
[RemoveKernelSpec] Removed /home/bamorim/.local/share/jupyter/kernels/julia-1.9.3_4_threads-1.9
Kernel specs to remove:
  julia-1.9.3_8_threads-1.9     /home/bamorim/.local/share/jupyter/kernels/julia-1.9.3_8_threads-1.9
Remove 1 kernel specs [y/N]: y
[RemoveKernelSpec] Removed /home/bamorim/.local/share/jupyter/kernels/julia-1.9.3_8_threads-1.9

Installed kernels:
[1] fssa
[2] julia-1.9
[3] python3

Add aditional IJulia jupyter kernels? [y/N]
$ y
Indicate the number of Julia threads for the kernel
(To add multiple kernels, indicate the number of threads for each kernel seperated by spaces)
$ 4 8
[ Info: Installing julia-1.9.3_4_threads kernelspec in /home/bamorim/.local/share/jupyter/kernels/julia-1.9.3_4_threads-1.9
[ Info: Installing julia-1.9.3_8_threads kernelspec in /home/bamorim/.local/share/jupyter/kernels/julia-1.9.3_8_threads-1.9

Installed kernels:
[1] fssa
[2] julia-1.9
[3] julia-1.9.3_4_threads-1.9
[4] julia-1.9.3_8_threads-1.9
[5] python3

