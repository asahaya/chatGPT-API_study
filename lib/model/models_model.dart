class ModelsModel {
  final String id;
  final int created;
  final String root;

  ModelsModel({required this.id, required this.created, required this.root});

  factory ModelsModel.fromJson(Map<String, dynamic> json) => ModelsModel(
        id: json["id"],
        created: json["created"],
        root: json["root"],
      );

  static List<ModelsModel> modelsFromSnapshot(List modelSnapshot) {
    return modelSnapshot.map((e) => ModelsModel.fromJson(e)).toList();
  }
}


// {
//   "object": "list",
//   "data": [
//     {
//       "id": "model-id-0",
//       "object": "model",
//       "created": 1686935002,
//       "owned_by": "organization-owner"
//     },
//     {
//       "id": "model-id-1",
//       "object": "model",
//       "created": 1686935002,
//       "owned_by": "organization-owner",
//     },
//     {
//       "id": "model-id-2",
//       "object": "model",
//       "created": 1686935002,
//       "owned_by": "openai"
//     },
//   ],
//   "object": "list"
// }
