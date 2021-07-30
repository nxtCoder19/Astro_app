class TagsData {
  TagsData({
    this.tags = '',
  });

  String tags;

  static Future<List<TagsData>> getTagsDataData() async{
    return tagsData;
  }

  static List<TagsData> tagsData = <TagsData>[
    TagsData(
      tags: 'Smoking',
    ),
    TagsData(
      tags: 'Vegan',
    ),
    TagsData(
      tags: 'Teetotaller',
    ),
    TagsData(
      tags:'Yoga',
    ),
    TagsData(
      tags: 'Drinking',
    ),
    TagsData(
      tags: 'Non Veg',
    ),
    TagsData(
      tags: 'Trying to Quit',
    ),
    TagsData(
      tags: 'Fitness Freak',
    ),
    TagsData(
      tags:'Aerobics',
    ),
    TagsData(
      tags: 'Non Smoker',
    ),
  ];
}