import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

class ArcBannerImage extends StatelessWidget {
  const ArcBannerImage(this.imageUrl, this.movieId, Key? key) : super(key: key);

  final String imageUrl;
  final String movieId;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return ClipPath(
      clipper: ArcClipper(),
      child: Hero(
        tag: movieId,
        child: CachedNetworkImage(
          width: screenWidth,
          height: 230.0,
          fit: BoxFit.cover,
          imageUrl: imageUrl,
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
          ),
          placeholder: (context, url) => const CupertinoActivityIndicator(),//Image(image: AssetImage(assetName)),
          errorWidget: (context, url, error) => const Image(
            image: AssetImage('assets/images/ic_placeholder.jpeg'),
          ),
        ),
      ),
    );
  }
}

class ArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 30);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstPoint = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstPoint.dx, firstPoint.dy);

    var secondControlPoint = Offset(size.width - (size.width / 4), size.height);
    var secondPoint = Offset(size.width, size.height - 30);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondPoint.dx, secondPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
