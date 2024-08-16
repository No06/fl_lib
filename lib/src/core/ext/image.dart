import 'package:image/image.dart' as img;

extension ImgX on img.Image {
  img.Image addPadding(
    int padding, {
    img.Color? paddingColor,
  }) {
    paddingColor ??= img.ColorRgb8(255, 255, 255);

    final int newWidth = width + (padding * 2);
    final int newHeight = height + (padding * 2);

    // Create a new image with padding
    final img.Image paddedImage = img.Image(width: newWidth, height: newHeight);

    // Fill the new image with the padding color
    img.fill(paddedImage, color: paddingColor);

    // Copy the original image onto the new image with offset
    for (int y = 0; y < height; y++) {
      for (int x = 0; x < width; x++) {
        paddedImage.setPixel(x + padding, y + padding, getPixel(x, y));
      }
    }

    return paddedImage;
  }
}
