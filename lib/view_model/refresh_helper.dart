import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:massageflutterapp/generated/l10n.dart';
/// 首页列表的header
class RefreshHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClassicHeader(
        failedText:S.of(context).failedText,
        idleText:S.of(context).idleText,
        releaseText:S.of(context).releaseText,
        refreshingText:S.of(context).refreshingText,
        completeText:S.of(context).completeText,
        canTwoLevelText:S.of(context).canTwoLevelText,
        // failedText: "加载失败", idleText: "下拉刷新", releaseText: "松开刷新", refreshingText: "刷新中…", completeText: "正在刷新...", canTwoLevelText: "松开刷新"
    );
  }
}

/// 通用的footer
///
/// 由于国际化需要context的原因,所以无法在[RefreshConfiguration]配置
class RefresherFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClassicFooter(
      failedText:S.of(context).failedText,
      idleText:S.of(context).idleText,
      loadingText:S.of(context).loadingText,
      noDataText:S.of(context).noDataText,
      // failedText: "加载失败",
      // idleText: "下拉刷新",
      // loadingText: "正在加载...",
      // noDataText: "暂无数据",
    );
  }
}
