import 'package:flutter_getx_tdd_template/app/core/model/github_search_query_param.dart';
import 'package:flutter_getx_tdd_template/app/data/model/github_project_search_response.dart';

abstract class GithubRepository{
  Future<GithubProjectSearchResponse> searchProject(
      GithubSearchQueryParam queryParam
      );

  Future<Item> getProject(String userName,String repositoryName);
}