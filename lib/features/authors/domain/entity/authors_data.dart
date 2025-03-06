import 'package:equatable/equatable.dart';

class AuthorsData extends Equatable {
  final int? numFound;
  final int? start;
  final bool? numFoundExact;
  final List<Author>? docs;

  const AuthorsData({this.numFound, this.start, this.numFoundExact, this.docs});

  @override
  List<Object?> get props => [numFound, start, numFoundExact, docs];
}

class Author extends Equatable {
  final String? key;
  final String? name;
  final String? birthDate;
  final List<String>? alternateNames;
  final List<String>? topSubjects;
  final String? topWork;
  final String? type;
  final int? workCount;
  final double? ratingsAverage;
  final double? ratingsSortable;
  final int? ratingsCount;
  final int? ratingsCount1;
  final int? ratingsCount2;
  final int? ratingsCount3;
  final int? ratingsCount4;
  final int? ratingsCount5;
  final int? wantToReadCount;
  final int? alreadyReadCount;
  final int? currentlyReadingCount;
  final int? readingLogCount;

  const Author({
    this.key,
    this.name,
    this.birthDate,
    this.alternateNames,
    this.topSubjects,
    this.topWork,
    this.type,
    this.workCount,
    this.ratingsAverage,
    this.ratingsSortable,
    this.ratingsCount,
    this.ratingsCount1,
    this.ratingsCount2,
    this.ratingsCount3,
    this.ratingsCount4,
    this.ratingsCount5,
    this.wantToReadCount,
    this.alreadyReadCount,
    this.currentlyReadingCount,
    this.readingLogCount,
  });

  @override
  List<Object?> get props => [
    key,
    name,
    birthDate,
    alternateNames,
    topSubjects,
    topWork,
    type,
    workCount,
    ratingsAverage,
    ratingsSortable,
    ratingsCount,
    ratingsCount1,
    ratingsCount2,
    ratingsCount3,
    ratingsCount4,
    ratingsCount5,
    wantToReadCount,
    alreadyReadCount,
    currentlyReadingCount,
    readingLogCount,
  ];
}
