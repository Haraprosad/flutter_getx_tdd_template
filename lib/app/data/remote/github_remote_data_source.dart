
import 'package:flutter_getx_tdd_template/app/data/model/github_project_search_response.dart';

import '/app/core/model/github_search_query_param.dart';

abstract class GithubRemoteDataSource {
  Future<GithubProjectSearchResponse> searchGithubProject(
      GithubSearchQueryParam queryParam);

  Future<Item> getGithubProjectDetails(String userName, String repositoryName);
}
