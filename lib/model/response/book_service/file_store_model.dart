class FileStoreListModel {
  List<FileStoreModel>? fileStoreIds;

  FileStoreListModel({this.fileStoreIds});

  FileStoreListModel.fromJson(Map<String, dynamic> json) {
    if (json['fileStoreIds'] != null) {
      fileStoreIds = <FileStoreModel>[];
      json['fileStoreIds'].forEach((v) {
        fileStoreIds!.add(FileStoreModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (fileStoreIds != null) {
      data['fileStoreIds'] = fileStoreIds!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FileStoreModel {
  String? name;
  String? fileStoreId;
  String? tenantId;
  String? id;
  String? url;

  FileStoreModel({this.name, this.id, this.url, this.fileStoreId, this.tenantId});

  FileStoreModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    fileStoreId = json['fileStoreId'];
    tenantId = json['tenantId'];
    id = json['id'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['fileStoreId'] = fileStoreId;
    data['tenantId'] = tenantId;
    data['id'] = id;
    data['url'] = url;
    return data;
  }
}
