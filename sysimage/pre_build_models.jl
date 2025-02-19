import MeshArrays
MeshArrays.GRID_LLC90_download()

import OceanStateEstimation
OceanStateEstimation.ECCOdiags_download()
 
#OceanStateEstimation.ECCOdiags_add("interp_coeffs")
OceanStateEstimation.Downloads.download(
  "https://zenodo.org/record/5784905/files/interp_coeffs_halfdeg.jld2",
  joinpath(OceanStateEstimation.ECCOdiags_path,"interp_coeffs_halfdeg.jld2");
  timeout=60000.0)

using PlutoSliderServer, ClimateModels
pth=dirname(pathof(ClimateModels))

## Hector

if false
fil=joinpath(pth,"..","examples","Hector.jl")
PlutoSliderServer.export_notebook(fil)

tmp1=readdir(tempdir())
tst1=[isfile(joinpath(tempdir(),i,"hector","src","hector")) for i in tmp1]
tst2=[!islink(joinpath(tempdir(),i,"hector","src","hector")) for i in tmp1]
ii=findall(tst1.*tst2)[1]
symlink(joinpath(tempdir(),tmp1[ii],"hector","src","hector"),"hector")
end

## Speedy

if false
fil=joinpath(pth,"..","examples","Speedy.jl")
PlutoSliderServer.export_notebook(fil)

tmp1=readdir(tempdir())
tst1=[isfile(joinpath(tempdir(),i,"bin","speedy")) for i in tmp1]
ii=findall(tst1)[1]
symlink(joinpath(tempdir(),tmp1[ii],"bin","speedy"),"speedy")
end

## MITgcm

fil=joinpath(pth,"..","examples","MITgcm.jl")
PlutoSliderServer.export_notebook(fil)

