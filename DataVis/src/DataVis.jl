module DataVis

using NIfTI, Colors, ImageShow, MosaicViews

export readnii, normalize_data, viewvolume

function readnii(filepath::AbstractString)
    return niread(filepath)
end

function normalize_data(vol::NIfTI.NIVolume)
    return vol.raw./findmax(vol.raw)[1];
end

function normalize_data(vol::Union{NIfTI.MappedArrays.MappedArray,Array})
    return vol./findmax(vol)[1];
end

function viewvolume(vol::Union{NIfTI.NIVolume,NIfTI.MappedArray,Array},numrow::Int=4)
    normvol=normalize_data(vol);
    img=Gray.(normvol);
    mosaicview(img,nrow=numrow,rowmajor=true)
end

# add time curve plotting
# tsview-esque func?
#modify normalization to take argument for what to normalize to


end # module DataVis
