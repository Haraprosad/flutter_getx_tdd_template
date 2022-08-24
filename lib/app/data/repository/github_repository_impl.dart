import 'package:flutter_getx_tdd_template/app/data/model/github_project_search_response.dart';
import 'package:flutter_getx_tdd_template/app/data/remote/github_remote_data_source.dart';
import 'package:flutter_getx_tdd_template/app/data/repository/github_repository.dart';
import 'package:flutter_getx_tdd_template/app/core/model/github_search_query_param.dart';
import 'package:get/get.dart';

class GithubRepositoryImpl implements GithubRepository{

  final GithubRemoteDataSource _remoteSource =
  Get.find(tag: (GithubRemoteDataSource).toString());

  @override
  Future<Item> getProject(String userName, String repositoryName) {
    return _remoteSource.getGithubProjectDetails(userName, repositoryName);
  }

  @override
  Future<GithubProjectSearchResponse> searchProject(GithubSearchQueryParam queryParam) {
    return _remoteSource.searchGithubProject(queryParam);
  }
  
}