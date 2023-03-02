% Gets the projection of the image on the coronal and sagittal planes.
function [sag, cor] = getplanes(images)
    hlf = round(size(images, 2) / 2);
    sag = squeeze(images(:, hlf, :));
    cor = squeeze(images(hlf, :, :));
end

