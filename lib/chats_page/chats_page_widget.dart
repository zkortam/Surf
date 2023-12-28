import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/p_c_nav_bar_widget.dart';
import '/components/view_image_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'chats_page_model.dart';
export 'chats_page_model.dart';

class ChatsPageWidget extends StatefulWidget {
  const ChatsPageWidget({
    super.key,
    required this.chat,
  });

  final ChatsRecord? chat;

  @override
  _ChatsPageWidgetState createState() => _ChatsPageWidgetState();
}

class _ChatsPageWidgetState extends State<ChatsPageWidget> {
  late ChatsPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChatsPageModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return StreamBuilder<ChatsRecord>(
      stream: ChatsRecord.getDocument(widget.chat!.reference),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: SpinKitRipple(
                  color: FlutterFlowTheme.of(context).secondaryText,
                  size: 50.0,
                ),
              ),
            ),
          );
        }
        final chatsPageChatsRecord = snapshot.data!;
        return Title(
            title: 'chatsPage',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () => _model.unfocusNode.canRequestFocus
                  ? FocusScope.of(context).requestFocus(_model.unfocusNode)
                  : FocusScope.of(context).unfocus(),
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                body: SafeArea(
                  top: true,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      wrapWithModel(
                        model: _model.pCNavBarModel,
                        updateCallback: () => setState(() {}),
                        child: const PCNavBarWidget(),
                      ),
                      if (responsiveVisibility(
                        context: context,
                        phone: false,
                        tablet: false,
                      ))
                        Align(
                          alignment: const AlignmentDirectional(0.0, -1.0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                30.0, 0.0, 0.0, 0.0),
                            child: Container(
                              width: 350.0,
                              height: double.infinity,
                              decoration: const BoxDecoration(),
                              child: StreamBuilder<List<ChatsRecord>>(
                                stream: queryChatsRecord(
                                  queryBuilder: (chatsRecord) =>
                                      chatsRecord.where(
                                    'users',
                                    arrayContains: currentUserUid,
                                  ),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 50.0,
                                        height: 50.0,
                                        child: SpinKitRipple(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 50.0,
                                        ),
                                      ),
                                    );
                                  }
                                  List<ChatsRecord> listViewChatsRecordList =
                                      snapshot.data!;
                                  return ListView.separated(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: listViewChatsRecordList.length,
                                    separatorBuilder: (_, __) =>
                                        const SizedBox(height: 20.0),
                                    itemBuilder: (context, listViewIndex) {
                                      final listViewChatsRecord =
                                          listViewChatsRecordList[
                                              listViewIndex];
                                      return Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 0.0),
                                        child: FutureBuilder<List<UsersRecord>>(
                                          future: queryUsersRecordOnce(
                                            queryBuilder: (usersRecord) =>
                                                usersRecord.where(
                                              'uid',
                                              isEqualTo:
                                                  functions.returnOtherUser(
                                                      currentUserUid,
                                                      listViewChatsRecord
                                                          .users.first,
                                                      listViewChatsRecord
                                                          .users.last),
                                              isNull:
                                                  (functions.returnOtherUser(
                                                          currentUserUid,
                                                          listViewChatsRecord
                                                              .users.first,
                                                          listViewChatsRecord
                                                              .users.last)) ==
                                                      null,
                                            ),
                                            singleRecord: true,
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child: SpinKitRipple(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 50.0,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<UsersRecord>
                                                rowUsersRecordList =
                                                snapshot.data!;
                                            final rowUsersRecord =
                                                rowUsersRecordList.isNotEmpty
                                                    ? rowUsersRecordList.first
                                                    : null;
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  'chats_page',
                                                  queryParameters: {
                                                    'chat': serializeParam(
                                                      listViewChatsRecord,
                                                      ParamType.Document,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    'chat': listViewChatsRecord,
                                                  },
                                                );
                                              },
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Flexible(
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Container(
                                                          width: 60.0,
                                                          height: 60.0,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration:
                                                              const BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Image.network(
                                                            rowUsersRecord!
                                                                .photoUrl,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  listViewChatsRecord
                                                                              .users
                                                                              .length >
                                                                          2
                                                                      ? listViewChatsRecord
                                                                          .title
                                                                      : rowUsersRecord
                                                                          .displayName,
                                                                  'User',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium,
                                                              ),
                                                              Text(
                                                                listViewChatsRecord
                                                                    .lastMessage
                                                                    .text,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      fontSize:
                                                                          13.0,
                                                                    ),
                                                              ),
                                                              Text(
                                                                dateTimeFormat(
                                                                  'relative',
                                                                  listViewChatsRecord
                                                                      .lastMessage
                                                                      .timestamp!,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      fontSize:
                                                                          12.0,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 60.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 15.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if (responsiveVisibility(
                                        context: context,
                                        tabletLandscape: false,
                                        desktop: false,
                                      ))
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 5.0, 0.0),
                                          child: FlutterFlowIconButton(
                                            borderRadius: 20.0,
                                            borderWidth: 1.0,
                                            buttonSize: 40.0,
                                            icon: Icon(
                                              Icons.keyboard_backspace,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryText,
                                              size: 24.0,
                                            ),
                                            onPressed: () async {
                                              context.pushNamed('chat_main');
                                            },
                                          ),
                                        ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 10.0, 0.0),
                                        child: StreamBuilder<List<UsersRecord>>(
                                          stream: queryUsersRecord(
                                            queryBuilder: (usersRecord) =>
                                                usersRecord.where(
                                              'uid',
                                              isEqualTo:
                                                  functions.returnOtherUser(
                                                      currentUserUid,
                                                      widget.chat!.users.first,
                                                      widget.chat!.users.last),
                                            ),
                                            singleRecord: true,
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child: SpinKitRipple(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 50.0,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<UsersRecord>
                                                circleImageUsersRecordList =
                                                snapshot.data!;
                                            // Return an empty Container when the item does not exist.
                                            if (snapshot.data!.isEmpty) {
                                              return Container();
                                            }
                                            final circleImageUsersRecord =
                                                circleImageUsersRecordList
                                                        .isNotEmpty
                                                    ? circleImageUsersRecordList
                                                        .first
                                                    : null;
                                            return Container(
                                              width: 40.0,
                                              height: 40.0,
                                              clipBehavior: Clip.antiAlias,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.network(
                                                valueOrDefault<String>(
                                                  circleImageUsersRecord
                                                      ?.photoUrl,
                                                  'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAAhFBMVEX///8AAADt7e3u7u7r6+v09PTx8fH4+Pjz8/PT09Oampqvr6/i4uKkpKRRUVHFxcW2traKiooODg6mpqZ3d3ebm5u/v7/Ly8toaGhFRUXg4OBNTU0/Pz/GxsYbGxvY2NhZWVkuLi43NzdhYWEhISFvb28nJyeRkZGDg4MTExNtbW0jIyMkN6ucAAAUEElEQVR4nNVdaWOzqhI2IotRs+/pkqVt0r7///9dYxIZEA0MpD3XD+d9TiPIKDAPw8wQRZcrJoTET0GUk81wNO3PjtvD19tk0uv1JpO3r8P2OOtPR8NNzOmTWxA9qX4mypan2XhwkanrmgzOWcojKtj/lYScLouftweyKXKuiiXl/xcSkvLf9/nAQTh5bedpWZo8R8LySvwRETwZrVDS3a/VKOfi3sogrargtcLEDxEWsWztJd71Wk/LmkigVpUoUKcov950G0C8u5BJ+SX9W1UNmzAS8oVf52xex0WYiSeMhLx4pBMw12TOg0goh2SCQiTazCyaezjOxvNpVhTTosim8/HseLAoNcsj4tm+24SKK1yhtHv0HWanLK1oC6VCsKpsyQbo9U9p1p91S7pNPdt3u9BdYfnS3rj1aZGUup92TBlMiFLPJ4t+x2t6Wf6Zxmc8bZVvN1+68U26nO9aZUw5+wMJS/laXvzHKRW8pJmO9VEu0tOHucptKeNvcxqafxrbsi8SVH134pEUe2O9PzlFthTHaRidm5rx3c8j4cdGiIiS/rep8jllv8ZpGB+a1g0/qVMtXSg1dZDvIf8ljS8SA3+Z9JOQS1mazA0kYpWIX5Fw1Hz0YcRpCHYLEOUjw0ydISR05jTHxmMHqTfzMCEWpc115pE71uLIaWK+aDxzu7zP5OGEuz2N8WVTIy2429Mip89Oz/rz/LQxilXM3Aa8k4Rk33ihT5FLRQt9ztnHz5JwqMvXf6JcEDWU79BdQht+MNYes8vty3qiXOes4ydwGqLPa8MQNhRr9Ko9fUCsy1rqQ6Zx4tnDEqGRts7+YHZlbTX+RnuFi9+SCyBdUW1CSqj1kV3M/kBCEWuj8dVOQhtOk6k1F5yE5i9WBCDmhdqQLBSnOSnVfue/L1yNclU3nizKRp2fOG4KuAtjqMUismuK6KvxVTU45n8sIdfa4y+hWuEIswgNi/hIF9GP06hdNKXP5y8PEU21jurFaRQB3/LW+34X5W+qiN0lOvWhoiYOf6IFTYjFiqE86yrRrfEVRb8WaJNlcMSEslH5ipVQoWoD/udyQcSVhcCmS8J2TsNgHTtK/kTFtyKqKEaG4TQEriYG9M9F0hGFX/GDtN4XGT7sFcEK1tRfz5P7nlpU/iv8Jy3C4VgctN7XKiHU9HsRYPAsp6fPwWH/b38YfJ6mr971xUTAGXXsKiG0ybzFXv5KgkbLcXMf9DBeRlT4SMgSqBfbbDc3CXUuEMO25MyDgwi+MO9SXa6fBRcxtuY4ZjmsjDhwmpjuQclU+9UBERFNu50YJlOv3SpI4PbUntNwaBMZYXdcCKHkpEtkuE4Mv+dBIQ2fmfxTzBofWkTGHD/ZTS3ku1xT/JJMWUyZrEdGCTkotMMvl947vBi06+UdKyHhUPNzk4QGTgN2l77Lm5EquWjI0XUVqGeUiBCwY3xs3mfgNAIuKLA2GUZaPStarh3DmrfghJoJC06T6G8W0XlY3uI+u19v13vzTx8bLM+BvSV5rPE52MLeYZ3n0kb7e//O2Xt8rY/H79n5X/OWFPk0OBRXjYlRl5BBMkOQU9y73va3Io4E8ORmQkRx0XCeecdJSCA/Geo94SahZOxg3C4YjsnoWwBX3zRDicYu9gbxtBIxoN7edL8bjdNAP5lZhGIyTBOw1ASspQRpaJQNc3zaDQGKUtAuTqMQPWSXIaq/T/aghLpj8I0dGKCOXNl21zQ+ByT5FSehal5Yi4clqPIZB8jJDUwfn7xdQgbmwB3uSar90cgUG+9EcX84IZ8L5tOUKRJCTsOBb4e0jTqpX2UQzq0cQ2Ku7NMjSQYYX1veymnAJ5zjbCh8D9qaWZeFg3HPcbabPviIrZwGjAgcDVZcFqcOZeEqZI5cTMkaXto0/lLeg/STgYzv7FQWjsUYJyFQissWCeUnfHGv/4LgnLF1mxThFHBGLkkPoP0mTkPAKEwjDLcgUJsm8a+VvSMoADNxGvkWy8kIZTkBmmLhzEtAJzvhrEKgHwzAr7U+BC9xiXLGI2Csbx3Lxsob7qEmAcLARJLLVtUSSmp32YRBSCgW6gNcWwle8UKgWgD4VO3RJCUExpmSE6Dql7Ri5Vq2QnJluuMxpgWQk91jpiSnkQvlF1wsFFQVG8eyDT6UoHa6oDooIjhKo4RwabgdMeeqKyRNl2uOeUUx2GoZoVoQMdmGyZ26Xa8YjKEJ1kAq1yUj3DASsn1Yx0DwoRZC0YfAOjOnSAnBGCAoCeFkjJSQSnZ6t9hcLziGkJwJbOZscZN9iaTCiHESMiBIQoCEQs4zP9R9D6hCsp8XaI8ZSdwXiBZcEP2RzbjOJzdOI8f4hbBhGIWQ/WNo77+rIiJX6n2B3I+SCmMLOA2RTgnfTp0CICoZQ4LdZwHkdIbej5JmIkZqjS/k8gztfg+mevRuVSxpxxa9IyT70lTUEoLW5ahaLxJ+3as4eEhYL4C+0BLKfrDmd04DOse+uhtjwJCv/0iRWyxRQuW2F3duwR3t5eeqd5elpi0Eio1cUF3HJ+4VVUiyBuSLjmOgFypmVF1S3Sc4XR1DCWe4bl6hGZQQVwvQ7atawvpPH/i2Kd8QXcunv4Rx9AYrqS65VXQKIeHKQ8JVCAmlqeH9JqFkEqmH/2795tY4NlKhelJ/Q7TgjqTSn1//CMwbAscjqrlULs04uhY5Ib9wtI9NLOpaLgani9dL/YcdXpMRKjtYjPYdAZOEh8s8MDbwi8YH9pu58JBQ9v4lVkLQlJNH5LSQw27JSgmB/lh6+DkDF47CPab8ikBTMg93SPCiClFyGtC9KE5NVwgYlI9Yd1tAad7RfjwlkuPup1rO12R8jazwhupqezhTVjkpgCq82qJMycCMeMJ1ijuS4/sVZ6cBfiBHVAtqJNcXF6Oi7F0LPwnlEmyFMykDY5HLzpwBSXvDZUEvZ4jET0JgIskx2wLQTSLxk1A25bJLK90Xq3vQnAYuW8aY+CgqW7JHtqBGsiXQqf+A3HG6I2Ap6HFELWBfYSpQLaiRXEkPaCRtqDOK7qAVIqCJM0QtwOsHaXCtkTQaffOI1NX2PSWMwdqnK06nBYFdi5nPdFBJKAkWARVnXqEBFwSmii/nWr5k4dxXQkCwNsCZKPWPbALexWfHssAFYOVFPC6ISN42BDYa6iXcBRHodpk5lYUeNRv/YHjJ2xZAT+M7RY2UMAYXb1H4amYhYo3r2qaS4EwCSEgIaKnDVrca++I7HSgS9uUcfQghoVACrd8tyyo+xQvvCe9y1QrxLCeH4/UeD05zQVwJclpYlIjVlB6f3LMFVwTEqo00M923FoeY4qV/tiihOF/+E94tuCCp8rfyc45pkAHAVDf2w6PBmKtxe+iQBBVJjnuQinYeRsJYaOmkxu0pukkjNdMQu8WuS1hPoF/SzDnFLVsNKkNL9tKbx9wUosk40VNcZaGSUshVwFtUE+9MOrt5MopmzNpsyXXbjeDLRv7hKdJ5tokkbZtICYsgVTcZyu06ZxvOxU04uskaue1cWVA3qq12E6kasTFOJkSbyQcv18vqfOqfzitz2F6gBN6xKmEP0ptw9cf03eVkhMv1/R5okrkiQEaf8g3LaYS5JWlfsbDnW4BvqI1DX05zR4znLqcIvOScBXmuYRyqc6k/p7khQ+rR7muwvJO4EC2Ac2l4fVgqute9o3yXa/8aLlEo1IfBOQ3jS5uU+abrsMSn7W7nNKF5KW3kqXS5dnmYfMuQl6prC39V2zc3/XL9281m5/N5NhsYQmTvV9+7BfraQlsf+lVN3/fmdg/mww3jN+pGOWf5sC2P/v7dZ5PPsD4MuMYnel7D6/UxrqJk1QVGtU2cjo28oPDYbL+jevDNQtppjDH455S3bwkLnhr4aYjMhXVd/YC2tqSZxeQwosaFE+A+VIz2jXLfSTAJp8BIUg0SPI9YNtq5XtqULVu0bNKfpVdbFHupXJEvkWcPVKi5JtwvSuVmVwvjiy+9+BTvlaPZvMPsW/CGksgil8gb0VxS9j0WU8q+hXSx99l70jNhr7hzLVxfjIzxEip7T0H2D/VUQkNULXpGdIv0q20Swv1DruwB4xSspgbXyDjwSF9wFahaEm0PWNvHR1RItSF08mAjWm/PsA7VSlf39cVgmppwyXnfRJqBJ8UZiFVfDF9/mlxt0wbTIoC0vCG553u6EEZfnyhlMTjBtQiijUKNDqha5MxXqRzFr82ZPShm3becuJQ1IpYryVFmmFpUV2PFN9GVPQhl3JRTcwgbD1e+4sI9Akr1TfTzL4VJFK7M1qeD3pGSG9Y9XFDzL/XyEebKwUHeC4IaKbPX0XW5SDUfYQ8/b6b00aWvXAApOZoXjioD+HnTKu7J7Ktvo2AFbEcRMhEvhTRpIpzKxrKTD24e/zDewsncA7f/fKKdTAj6A8zdjGRavEWEj5mB08yXVQkXBLO5JU5lmzEzyLgnxT0IkyaiG8HZxm3ZI9/NXUBc7JqS+WweSi6A4BjI7csaY9eM8YeP2AM8oexgVcIV7eUDzvYR5o34w7glhvQx8wCveEP8mUwDKcn7HNiSfDFJFUN6+a6oOGAl/2DgDnpDYKDPEWzhFgd8+Q8qllt5wc+REHYT67LSJpbJWG5MPD5gHf3gk8wdAfvPq21ZuTKpBLznp2nmVHikVoFlzLIEBsmHrCxLNHMqVBeT3fTHbucHJEU9hdgrMiMQgtGzI5QgL8b0lhejuoiSEsSmG2WwwDM66BWBdlkdstqa2wTmp+lb+bXIZdPnMw8vAe6qR5sSrflp3HMMyVeFS31miaAhz6ZEe44hJU+Uha1FjuePMD69bYhLktmWjRjaeEx5ouLbfKPn+upkD0JO4/2u+wIg+aSTeFzClOvrTrWd8rUBEoTPiG+H5NJu/XDAm/O13SV0yrknDR8fIR0KTQh004dLqO6ce0rexAc7ieBdnbFx27YILGHSB859LXkT5TBVc192qVVAEEbtxxCFQUROHhnrLtGS+7KGev7SrgdLrUOfKNwVyQmi/6AEFEAehR6Bj22fg7bW95NndtAbqvXY8UGJzhy01f/b5xGu/Qp8MrXYopppPrB2WeQRts8FDTvO0yWcg0Z13Scbb8oFfe21oCP3O9lDfdvoOUxGQSNFwtb71Hze8leFv5hzsjfYAwikHJLnMBmAQKaF946nAWU3UHPbEPCxLfPqA72TPv/URxBI1bU31p5XH0qonI3Q7jHCpAXDbjHph+SS77V9b8zybATL8y3AUivEoXqPkFSIi3YJQbtzokooh2S12QL2fO5nlDQULFij4DPjOZgy6qeNWNt9+hkl8lfAaa5/pMCnddFWoeylTxZOm7lf215585wZ+WukfXars4JSKOHT9aHcaUnN91mdFSTL2Zz3VEdsH35FwprUJOb73M57UqxVrbFQd6o4/xUJa7tey31wv7jp1nCTEPCD5rlrTR5xv4Ubfw2Obk+bmn81nrvWwmluSDs7z8AjbpujqY9XsT0im/3laZ/G/DmEAO+bo6kW0vzsFucf8nxaLJy8gH0QidJplpttK8r5h8ayBgkDnWH5Kwh3hmWgc0h/AynnkJ7N55CqnOaGlEONUv3X/xBqO0u2g9PckJqjhP21IC2ocR6w6b7I8GEvCFKbb78znZ+GWAz9NF9b7muTMPy53OGR37nc2tnq/8EJ1fFsdQOjYNDt6n4+1fP5izVSjiH8aN8v69hnUvxYd/yZrAXBcxRN32MdJUz68IYUt/mtd766oAgazTrz35k1/h0pfqzr/9B0w4QSXdM2jT6WUA0oO8Rh8v/4IxbvYcOyrhItnKZGStDd96b1vt9F6onR3dHftwm1vUI1Ki2lfy1ciah6YvTpQYnI8GEVpMZajUKlOcIjrqSEu2j67hIPJdREHHP/OGs/PT/WBfSWUOuoASLJvSRUI+ItgjBvEnayBzXGd9Jiu/kVpMZE3Q8P7iz72HemRFoIZXEfjL/MZBo5GzKrsp368I5e1Zp38bM9MIxaUM/Z8GpT9oHGr5F+ILzJIvJspOcP21iVtZUwYlrCFezxfXik5a/7YHZlH3EaiYie+Gn4q8pej2Qf2PrxPOQ0AOlZBXbYoHQETdOzpozty0adn1hF+nvEH9LmiBopKVzixV0kjMhefxTy/G4n1MhQuCcutThJCN3obtchDZeCzIAYTxuJw2ZuJuqbhLbcgjdTPm5lCrLQTIbx5bbxvAV3e5oVp4FIDf2trkEaBc3Xd0PMlLjv6H7qgqU+BMiQnPQw4h6nFxkR5SNDElCrkAScxgdIJIa0lpN+EnIHhyb9Ztap3grBFjESlovQ1+/m43urNJiE6Y+h/rchZvltz2kUxKgxM9t3P4+E3wkLRERJ3/T+egVFbRC5cBoFifzT1Izevrj8jnptVWOSYm+s9zN3C1nHcRoFlZqqOZNfe9MpFZy6uvQxwUV6+jBXuU3x9iG0hJU2Nqc8Lq9df+k28dBlWx7FXu/Fi1V4SHhB7TL2euvTIok4paLdskMEpTxKFv2W7lDJt/Sbvm4S4pnHg3S6+9kpu37OUlRxNZqLUq7rn5ZZf9adznVrEe0UmNM0mUfeyK1uuA7H2bg/zYpiWhTZtD+eHW0S1c7yyD9KHKMPdcQL4/zueU3m3KtVPhq/ifjCLX3342sVKEV7KAljweNpx3TheK2nCfc4MTQApzEiFrHMJUt5u3giCnZOA57TGBERPBn5ddfVKOfC/7ynEJymtVNE0fvcNSH79drOL+GagYZNKI3fgjhfFj8upyN8r4olfU6w5nMkjAkTNOJpNh480iOTwThLeckHnuV3db1kzwiNOCeb4WLaPx+3h6+3yWVZO5m8fR22x3N/OhpuCOdPbsH/AKR8hACPM96RAAAAAElFTkSuQmCC',
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      StreamBuilder<List<UsersRecord>>(
                                        stream: queryUsersRecord(
                                          queryBuilder: (usersRecord) =>
                                              usersRecord.where(
                                            'uid',
                                            isEqualTo:
                                                functions.returnOtherUser(
                                                    currentUserUid,
                                                    widget.chat!.users.first,
                                                    widget.chat!.users.last),
                                          ),
                                          singleRecord: true,
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 50.0,
                                                height: 50.0,
                                                child: SpinKitRipple(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 50.0,
                                                ),
                                              ),
                                            );
                                          }
                                          List<UsersRecord>
                                              textUsersRecordList =
                                              snapshot.data!;
                                          // Return an empty Container when the item does not exist.
                                          if (snapshot.data!.isEmpty) {
                                            return Container();
                                          }
                                          final textUsersRecord =
                                              textUsersRecordList.isNotEmpty
                                                  ? textUsersRecordList.first
                                                  : null;
                                          return Text(
                                            valueOrDefault<String>(
                                              chatsPageChatsRecord
                                                          .users.length ==
                                                      2
                                                  ? textUsersRecord?.displayName
                                                  : chatsPageChatsRecord.title,
                                              'Chat',
                                            ),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Outfit',
                                                  fontSize: 18.0,
                                                ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 20.0),
                                  child: Builder(
                                    builder: (context) {
                                      final messages = chatsPageChatsRecord
                                          .chatMessages
                                          .toList();
                                      return SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: List.generate(
                                              messages.length, (messagesIndex) {
                                            final messagesItem =
                                                messages[messagesIndex];
                                            return StreamBuilder<
                                                List<UsersRecord>>(
                                              stream: queryUsersRecord(
                                                queryBuilder: (usersRecord) =>
                                                    usersRecord.where(
                                                  'uid',
                                                  isEqualTo:
                                                      messagesItem.authorID,
                                                ),
                                                singleRecord: true,
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child: SpinKitRipple(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 50.0,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<UsersRecord>
                                                    columnUsersRecordList =
                                                    snapshot.data!;
                                                // Return an empty Container when the item does not exist.
                                                if (snapshot.data!.isEmpty) {
                                                  return Container();
                                                }
                                                final columnUsersRecord =
                                                    columnUsersRecordList
                                                            .isNotEmpty
                                                        ? columnUsersRecordList
                                                            .first
                                                        : null;
                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    if ((messagesItem
                                                                .authorID !=
                                                            currentUserUid) &&
                                                        (messagesItem
                                                                    .image !=
                                                                ''))
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    24.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Container(
                                                              width: 36.0,
                                                              height: 36.0,
                                                              clipBehavior: Clip
                                                                  .antiAlias,
                                                              decoration:
                                                                  const BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                              ),
                                                              child:
                                                                  Image.network(
                                                                columnUsersRecord!
                                                                    .photoUrl,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                await showModalBottomSheet(
                                                                  isScrollControlled:
                                                                      true,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  enableDrag:
                                                                      false,
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (context) {
                                                                    return GestureDetector(
                                                                      onTap: () => _model
                                                                              .unfocusNode
                                                                              .canRequestFocus
                                                                          ? FocusScope.of(context).requestFocus(_model
                                                                              .unfocusNode)
                                                                          : FocusScope.of(context)
                                                                              .unfocus(),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            MediaQuery.viewInsetsOf(context),
                                                                        child:
                                                                            ViewImageWidget(
                                                                          image:
                                                                              messagesItem.image,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                ).then((value) =>
                                                                    safeSetState(
                                                                        () {}));
                                                              },
                                                              child: Stack(
                                                                children: [
                                                                  if (responsiveVisibility(
                                                                    context:
                                                                        context,
                                                                    phone:
                                                                        false,
                                                                    tablet:
                                                                        false,
                                                                  ))
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            330.0,
                                                                        height:
                                                                            230.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          image:
                                                                              DecorationImage(
                                                                            fit:
                                                                                BoxFit.cover,
                                                                            image:
                                                                                Image.network(
                                                                              messagesItem.image,
                                                                            ).image,
                                                                          ),
                                                                          borderRadius:
                                                                              const BorderRadius.only(
                                                                            bottomLeft:
                                                                                Radius.circular(24.0),
                                                                            bottomRight:
                                                                                Radius.circular(24.0),
                                                                            topLeft:
                                                                                Radius.circular(3.0),
                                                                            topRight:
                                                                                Radius.circular(24.0),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  if (responsiveVisibility(
                                                                    context:
                                                                        context,
                                                                    tabletLandscape:
                                                                        false,
                                                                    desktop:
                                                                        false,
                                                                  ))
                                                                    Padding(
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            260.0,
                                                                        height:
                                                                            180.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          image:
                                                                              DecorationImage(
                                                                            fit:
                                                                                BoxFit.cover,
                                                                            image:
                                                                                Image.network(
                                                                              messagesItem.image,
                                                                            ).image,
                                                                          ),
                                                                          borderRadius:
                                                                              const BorderRadius.only(
                                                                            bottomLeft:
                                                                                Radius.circular(24.0),
                                                                            bottomRight:
                                                                                Radius.circular(24.0),
                                                                            topLeft:
                                                                                Radius.circular(3.0),
                                                                            topRight:
                                                                                Radius.circular(24.0),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    if ((messagesItem
                                                                .authorID ==
                                                            currentUserUid) &&
                                                        (messagesItem
                                                                    .image !=
                                                                ''))
                                                      Padding(
                                                        padding:
                                                            const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    24.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            InkWell(
                                                              splashColor: Colors
                                                                  .transparent,
                                                              focusColor: Colors
                                                                  .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              onTap: () async {
                                                                await showModalBottomSheet(
                                                                  isScrollControlled:
                                                                      true,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  enableDrag:
                                                                      false,
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (context) {
                                                                    return GestureDetector(
                                                                      onTap: () => _model
                                                                              .unfocusNode
                                                                              .canRequestFocus
                                                                          ? FocusScope.of(context).requestFocus(_model
                                                                              .unfocusNode)
                                                                          : FocusScope.of(context)
                                                                              .unfocus(),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            MediaQuery.viewInsetsOf(context),
                                                                        child:
                                                                            ViewImageWidget(
                                                                          image:
                                                                              messagesItem.image,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                ).then((value) =>
                                                                    safeSetState(
                                                                        () {}));
                                                              },
                                                              child: Stack(
                                                                children: [
                                                                  if (responsiveVisibility(
                                                                    context:
                                                                        context,
                                                                    phone:
                                                                        false,
                                                                    tablet:
                                                                        false,
                                                                  ))
                                                                    Container(
                                                                      width:
                                                                          330.0,
                                                                      height:
                                                                          230.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        image:
                                                                            DecorationImage(
                                                                          fit: BoxFit
                                                                              .cover,
                                                                          image:
                                                                              Image.network(
                                                                            messagesItem.image,
                                                                          ).image,
                                                                        ),
                                                                        borderRadius:
                                                                            const BorderRadius.only(
                                                                          bottomLeft:
                                                                              Radius.circular(24.0),
                                                                          bottomRight:
                                                                              Radius.circular(24.0),
                                                                          topLeft:
                                                                              Radius.circular(24.0),
                                                                          topRight:
                                                                              Radius.circular(3.0),
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          const Stack(
                                                                        children: [
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.9, 0.85),
                                                                            child:
                                                                                FaIcon(
                                                                              FontAwesomeIcons.check,
                                                                              color: Colors.white,
                                                                              size: 16.0,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  if (responsiveVisibility(
                                                                    context:
                                                                        context,
                                                                    tabletLandscape:
                                                                        false,
                                                                    desktop:
                                                                        false,
                                                                  ))
                                                                    Container(
                                                                      width:
                                                                          260.0,
                                                                      height:
                                                                          180.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        image:
                                                                            DecorationImage(
                                                                          fit: BoxFit
                                                                              .cover,
                                                                          image:
                                                                              Image.network(
                                                                            messagesItem.image,
                                                                          ).image,
                                                                        ),
                                                                        borderRadius:
                                                                            const BorderRadius.only(
                                                                          bottomLeft:
                                                                              Radius.circular(24.0),
                                                                          bottomRight:
                                                                              Radius.circular(24.0),
                                                                          topLeft:
                                                                              Radius.circular(24.0),
                                                                          topRight:
                                                                              Radius.circular(3.0),
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          const Stack(
                                                                        children: [
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.9, 0.85),
                                                                            child:
                                                                                FaIcon(
                                                                              FontAwesomeIcons.check,
                                                                              color: Colors.white,
                                                                              size: 16.0,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    Stack(
                                                      children: [
                                                        if ((messagesItem
                                                                    .authorID !=
                                                                currentUserUid) &&
                                                            (messagesItem
                                                                        .text !=
                                                                    '') &&
                                                            ((widget.chat?.chatMessages[
                                                                        functions.subtracter(
                                                                            messagesIndex,
                                                                            1)])
                                                                    ?.authorID ==
                                                                messagesItem
                                                                    .authorID))
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Container(
                                                                  width: 36.0,
                                                                  height: 36.0,
                                                                  clipBehavior:
                                                                      Clip.antiAlias,
                                                                  decoration:
                                                                      const BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child: Image
                                                                      .network(
                                                                    columnUsersRecord!
                                                                        .photoUrl,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                                Stack(
                                                                  children: [
                                                                    if ((messagesItem.authorID !=
                                                                            currentUserUid) &&
                                                                        responsiveVisibility(
                                                                          context:
                                                                              context,
                                                                          phone:
                                                                              false,
                                                                          tablet:
                                                                              false,
                                                                        ))
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              310.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            borderRadius:
                                                                                const BorderRadius.only(
                                                                              bottomLeft: Radius.circular(24.0),
                                                                              bottomRight: Radius.circular(24.0),
                                                                              topLeft: Radius.circular(3.0),
                                                                              topRight: Radius.circular(24.0),
                                                                            ),
                                                                            border:
                                                                                Border.all(
                                                                              color: const Color(0xFF828282),
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                16.0,
                                                                                12.0,
                                                                                16.0,
                                                                                12.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              crossAxisAlignment: CrossAxisAlignment.end,
                                                                              children: [
                                                                                Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: [
                                                                                    Container(
                                                                                      width: 160.0,
                                                                                      constraints: const BoxConstraints(
                                                                                        maxWidth: 260.0,
                                                                                      ),
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      ),
                                                                                      child: Text(
                                                                                        messagesItem.text,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Outfit',
                                                                                              color: const Color(0xFF828282),
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: [
                                                                                    Text(
                                                                                      dateTimeFormat(
                                                                                        'jm',
                                                                                        messagesItem.timestamp!,
                                                                                        locale: FFLocalizations.of(context).languageCode,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Outfit',
                                                                                            color: const Color(0xFFE0E0E0),
                                                                                            fontSize: 12.0,
                                                                                          ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    if (((messagesItem.authorID !=
                                                                                currentUserUid) &&
                                                                            (messagesItem.text != '')) &&
                                                                        responsiveVisibility(
                                                                          context:
                                                                              context,
                                                                          tabletLandscape:
                                                                              false,
                                                                          desktop:
                                                                              false,
                                                                        ))
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              260.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            borderRadius:
                                                                                const BorderRadius.only(
                                                                              bottomLeft: Radius.circular(24.0),
                                                                              bottomRight: Radius.circular(24.0),
                                                                              topLeft: Radius.circular(3.0),
                                                                              topRight: Radius.circular(24.0),
                                                                            ),
                                                                            border:
                                                                                Border.all(
                                                                              color: const Color(0xFF828282),
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                16.0,
                                                                                12.0,
                                                                                16.0,
                                                                                12.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              crossAxisAlignment: CrossAxisAlignment.end,
                                                                              children: [
                                                                                Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: [
                                                                                    Container(
                                                                                      width: 160.0,
                                                                                      constraints: const BoxConstraints(
                                                                                        maxWidth: 260.0,
                                                                                      ),
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      ),
                                                                                      child: Text(
                                                                                        messagesItem.text,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Outfit',
                                                                                              color: const Color(0xFF828282),
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: [
                                                                                    Text(
                                                                                      dateTimeFormat(
                                                                                        'jm',
                                                                                        messagesItem.timestamp!,
                                                                                        locale: FFLocalizations.of(context).languageCode,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Outfit',
                                                                                            color: const Color(0xFFE0E0E0),
                                                                                            fontSize: 12.0,
                                                                                          ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        if ((messagesItem
                                                                    .authorID !=
                                                                currentUserUid) &&
                                                            (messagesItem
                                                                        .text !=
                                                                    '') &&
                                                            ((widget.chat?.chatMessages[
                                                                        functions.subtracter(
                                                                            messagesIndex,
                                                                            1)])
                                                                    ?.authorID !=
                                                                messagesItem
                                                                    .authorID))
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        24.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Container(
                                                                  width: 36.0,
                                                                  height: 36.0,
                                                                  clipBehavior:
                                                                      Clip.antiAlias,
                                                                  decoration:
                                                                      const BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                  ),
                                                                  child: Image
                                                                      .network(
                                                                    columnUsersRecord!
                                                                        .photoUrl,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                                Stack(
                                                                  children: [
                                                                    if ((messagesItem.authorID !=
                                                                            currentUserUid) &&
                                                                        responsiveVisibility(
                                                                          context:
                                                                              context,
                                                                          phone:
                                                                              false,
                                                                          tablet:
                                                                              false,
                                                                        ))
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              310.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            borderRadius:
                                                                                const BorderRadius.only(
                                                                              bottomLeft: Radius.circular(24.0),
                                                                              bottomRight: Radius.circular(24.0),
                                                                              topLeft: Radius.circular(3.0),
                                                                              topRight: Radius.circular(24.0),
                                                                            ),
                                                                            border:
                                                                                Border.all(
                                                                              color: const Color(0xFF828282),
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                16.0,
                                                                                12.0,
                                                                                16.0,
                                                                                12.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              crossAxisAlignment: CrossAxisAlignment.end,
                                                                              children: [
                                                                                Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: [
                                                                                    Container(
                                                                                      width: 160.0,
                                                                                      constraints: const BoxConstraints(
                                                                                        maxWidth: 260.0,
                                                                                      ),
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      ),
                                                                                      child: Text(
                                                                                        messagesItem.text,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Outfit',
                                                                                              color: const Color(0xFF828282),
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: [
                                                                                    Text(
                                                                                      dateTimeFormat(
                                                                                        'jm',
                                                                                        messagesItem.timestamp!,
                                                                                        locale: FFLocalizations.of(context).languageCode,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Outfit',
                                                                                            color: const Color(0xFFE0E0E0),
                                                                                            fontSize: 12.0,
                                                                                          ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    if (((messagesItem.authorID !=
                                                                                currentUserUid) &&
                                                                            (messagesItem.text != '')) &&
                                                                        responsiveVisibility(
                                                                          context:
                                                                              context,
                                                                          tabletLandscape:
                                                                              false,
                                                                          desktop:
                                                                              false,
                                                                        ))
                                                                      Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              260.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            borderRadius:
                                                                                const BorderRadius.only(
                                                                              bottomLeft: Radius.circular(24.0),
                                                                              bottomRight: Radius.circular(24.0),
                                                                              topLeft: Radius.circular(3.0),
                                                                              topRight: Radius.circular(24.0),
                                                                            ),
                                                                            border:
                                                                                Border.all(
                                                                              color: const Color(0xFF828282),
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: const EdgeInsetsDirectional.fromSTEB(
                                                                                16.0,
                                                                                12.0,
                                                                                16.0,
                                                                                12.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              crossAxisAlignment: CrossAxisAlignment.end,
                                                                              children: [
                                                                                Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: [
                                                                                    Container(
                                                                                      width: 160.0,
                                                                                      constraints: const BoxConstraints(
                                                                                        maxWidth: 260.0,
                                                                                      ),
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      ),
                                                                                      child: Text(
                                                                                        messagesItem.text,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Outfit',
                                                                                              color: const Color(0xFF828282),
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: [
                                                                                    Text(
                                                                                      dateTimeFormat(
                                                                                        'jm',
                                                                                        messagesItem.timestamp!,
                                                                                        locale: FFLocalizations.of(context).languageCode,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Outfit',
                                                                                            color: const Color(0xFFE0E0E0),
                                                                                            fontSize: 12.0,
                                                                                          ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                    Stack(
                                                      children: [
                                                        if ((messagesItem
                                                                    .authorID ==
                                                                currentUserUid) &&
                                                            ((widget.chat?.chatMessages[
                                                                        functions.subtracter(
                                                                            messagesIndex,
                                                                            1)])
                                                                    ?.authorID ==
                                                                currentUserUid))
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        10.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Stack(
                                                                  children: [
                                                                    if ((messagesItem.text !=
                                                                                '') &&
                                                                        responsiveVisibility(
                                                                          context:
                                                                              context,
                                                                          phone:
                                                                              false,
                                                                          tablet:
                                                                              false,
                                                                        ))
                                                                      Container(
                                                                        width:
                                                                            310.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              const Color(0xFFEBF0FE),
                                                                          borderRadius:
                                                                              const BorderRadius.only(
                                                                            bottomLeft:
                                                                                Radius.circular(24.0),
                                                                            bottomRight:
                                                                                Radius.circular(24.0),
                                                                            topLeft:
                                                                                Radius.circular(24.0),
                                                                            topRight:
                                                                                Radius.circular(3.0),
                                                                          ),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                const Color(0xFF5780F7),
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              16.0,
                                                                              12.0,
                                                                              16.0,
                                                                              12.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.end,
                                                                            children: [
                                                                              Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Container(
                                                                                    width: 160.0,
                                                                                    decoration: const BoxDecoration(),
                                                                                    child: Text(
                                                                                      messagesItem.text,
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Outfit',
                                                                                            color: const Color(0xFF5780F7),
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: [
                                                                                      Text(
                                                                                        dateTimeFormat(
                                                                                          'jm',
                                                                                          messagesItem.timestamp!,
                                                                                          locale: FFLocalizations.of(context).languageCode,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Outfit',
                                                                                              color: const Color(0x9A5780F7),
                                                                                              fontSize: 12.0,
                                                                                            ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 0.0, 0.0),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        if (messagesItem.timestamp != widget.chat?.lastMessage.timestamp)
                                                                                          const FaIcon(
                                                                                            FontAwesomeIcons.checkDouble,
                                                                                            color: Color(0xFF5780F7),
                                                                                            size: 16.0,
                                                                                          ),
                                                                                        if (messagesItem.timestamp == widget.chat?.lastMessage.timestamp)
                                                                                          const FaIcon(
                                                                                            FontAwesomeIcons.check,
                                                                                            color: Color(0xFFBDBDBD),
                                                                                            size: 16.0,
                                                                                          ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    if (((messagesItem.text != '') &&
                                                                            (messagesItem.authorID ==
                                                                                currentUserUid)) &&
                                                                        responsiveVisibility(
                                                                          context:
                                                                              context,
                                                                          tabletLandscape:
                                                                              false,
                                                                          desktop:
                                                                              false,
                                                                        ))
                                                                      Container(
                                                                        width:
                                                                            260.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              const Color(0xFFEBF0FE),
                                                                          borderRadius:
                                                                              const BorderRadius.only(
                                                                            bottomLeft:
                                                                                Radius.circular(24.0),
                                                                            bottomRight:
                                                                                Radius.circular(24.0),
                                                                            topLeft:
                                                                                Radius.circular(24.0),
                                                                            topRight:
                                                                                Radius.circular(3.0),
                                                                          ),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                const Color(0xFF5780F7),
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              16.0,
                                                                              12.0,
                                                                              16.0,
                                                                              12.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.end,
                                                                            children: [
                                                                              Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Container(
                                                                                    width: 160.0,
                                                                                    decoration: const BoxDecoration(),
                                                                                    child: Text(
                                                                                      messagesItem.text,
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Outfit',
                                                                                            color: const Color(0xFF5780F7),
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: [
                                                                                      Text(
                                                                                        dateTimeFormat(
                                                                                          'jm',
                                                                                          messagesItem.timestamp!,
                                                                                          locale: FFLocalizations.of(context).languageCode,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Outfit',
                                                                                              color: const Color(0x9A5780F7),
                                                                                              fontSize: 12.0,
                                                                                            ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 0.0, 0.0),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        if (messagesItem.timestamp != widget.chat?.lastMessage.timestamp)
                                                                                          const FaIcon(
                                                                                            FontAwesomeIcons.checkDouble,
                                                                                            color: Color(0xFF5780F7),
                                                                                            size: 16.0,
                                                                                          ),
                                                                                        if (messagesItem.timestamp == widget.chat?.lastMessage.timestamp)
                                                                                          const FaIcon(
                                                                                            FontAwesomeIcons.check,
                                                                                            color: Color(0xFFBDBDBD),
                                                                                            size: 16.0,
                                                                                          ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        if ((messagesItem
                                                                    .authorID ==
                                                                currentUserUid) &&
                                                            ((widget.chat?.chatMessages[
                                                                        functions.subtracter(
                                                                            messagesIndex,
                                                                            1)])
                                                                    ?.authorID !=
                                                                messagesItem
                                                                    .authorID))
                                                          Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        24.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Stack(
                                                                  children: [
                                                                    if ((messagesItem.text !=
                                                                                '') &&
                                                                        responsiveVisibility(
                                                                          context:
                                                                              context,
                                                                          phone:
                                                                              false,
                                                                          tablet:
                                                                              false,
                                                                        ))
                                                                      Container(
                                                                        width:
                                                                            310.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              const Color(0xFFEBF0FE),
                                                                          borderRadius:
                                                                              const BorderRadius.only(
                                                                            bottomLeft:
                                                                                Radius.circular(24.0),
                                                                            bottomRight:
                                                                                Radius.circular(24.0),
                                                                            topLeft:
                                                                                Radius.circular(24.0),
                                                                            topRight:
                                                                                Radius.circular(3.0),
                                                                          ),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                const Color(0xFF5780F7),
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              16.0,
                                                                              12.0,
                                                                              16.0,
                                                                              12.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.end,
                                                                            children: [
                                                                              Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Container(
                                                                                    width: 160.0,
                                                                                    decoration: const BoxDecoration(),
                                                                                    child: Text(
                                                                                      messagesItem.text,
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Outfit',
                                                                                            color: const Color(0xFF5780F7),
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: [
                                                                                      Text(
                                                                                        dateTimeFormat(
                                                                                          'jm',
                                                                                          messagesItem.timestamp!,
                                                                                          locale: FFLocalizations.of(context).languageCode,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Outfit',
                                                                                              color: const Color(0x9A5780F7),
                                                                                              fontSize: 12.0,
                                                                                            ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 0.0, 0.0),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        if (messagesItem.timestamp != widget.chat?.lastMessage.timestamp)
                                                                                          const FaIcon(
                                                                                            FontAwesomeIcons.checkDouble,
                                                                                            color: Color(0xFF5780F7),
                                                                                            size: 16.0,
                                                                                          ),
                                                                                        if (messagesItem.timestamp == widget.chat?.lastMessage.timestamp)
                                                                                          const FaIcon(
                                                                                            FontAwesomeIcons.check,
                                                                                            color: Color(0xFFBDBDBD),
                                                                                            size: 16.0,
                                                                                          ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    if (((messagesItem.text != '') &&
                                                                            (messagesItem.authorID ==
                                                                                currentUserUid)) &&
                                                                        responsiveVisibility(
                                                                          context:
                                                                              context,
                                                                          tabletLandscape:
                                                                              false,
                                                                          desktop:
                                                                              false,
                                                                        ))
                                                                      Container(
                                                                        width:
                                                                            260.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              const Color(0xFFEBF0FE),
                                                                          borderRadius:
                                                                              const BorderRadius.only(
                                                                            bottomLeft:
                                                                                Radius.circular(24.0),
                                                                            bottomRight:
                                                                                Radius.circular(24.0),
                                                                            topLeft:
                                                                                Radius.circular(24.0),
                                                                            topRight:
                                                                                Radius.circular(3.0),
                                                                          ),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                const Color(0xFF5780F7),
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                                              16.0,
                                                                              12.0,
                                                                              16.0,
                                                                              12.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.end,
                                                                            children: [
                                                                              Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Container(
                                                                                    width: 160.0,
                                                                                    decoration: const BoxDecoration(),
                                                                                    child: Text(
                                                                                      messagesItem.text,
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: 'Outfit',
                                                                                            color: const Color(0xFF5780F7),
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: [
                                                                                      Text(
                                                                                        dateTimeFormat(
                                                                                          'jm',
                                                                                          messagesItem.timestamp!,
                                                                                          locale: FFLocalizations.of(context).languageCode,
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: 'Outfit',
                                                                                              color: const Color(0x9A5780F7),
                                                                                              fontSize: 12.0,
                                                                                            ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: const EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 0.0, 0.0),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        if (messagesItem.timestamp != widget.chat?.lastMessage.timestamp)
                                                                                          const FaIcon(
                                                                                            FontAwesomeIcons.checkDouble,
                                                                                            color: Color(0xFF5780F7),
                                                                                            size: 16.0,
                                                                                          ),
                                                                                        if (messagesItem.timestamp == widget.chat?.lastMessage.timestamp)
                                                                                          const FaIcon(
                                                                                            FontAwesomeIcons.check,
                                                                                            color: Color(0xFFBDBDBD),
                                                                                            size: 16.0,
                                                                                          ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                      ],
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          }),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Container(
                                constraints: const BoxConstraints(
                                  minWidth: 400.0,
                                  maxWidth: 2000.0,
                                ),
                                decoration: const BoxDecoration(),
                                child: Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      5.0, 10.0, 5.0, 10.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Align(
                                          alignment:
                                              const AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 5.0, 0.0),
                                            child: Container(
                                              width: double.infinity,
                                              height: 45.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(50.0),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        12.0, 0.0, 12.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  2.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          final selectedMedia =
                                                              await selectMedia(
                                                            maxWidth: 300.00,
                                                            maxHeight: 300.00,
                                                            imageQuality: 50,
                                                            mediaSource:
                                                                MediaSource
                                                                    .photoGallery,
                                                            multiImage: false,
                                                          );
                                                          if (selectedMedia !=
                                                                  null &&
                                                              selectedMedia.every((m) =>
                                                                  validateFileFormat(
                                                                      m.storagePath,
                                                                      context))) {
                                                            setState(() => _model
                                                                    .isDataUploading =
                                                                true);
                                                            var selectedUploadedFiles =
                                                                <FFUploadedFile>[];

                                                            var downloadUrls =
                                                                <String>[];
                                                            try {
                                                              showUploadMessage(
                                                                context,
                                                                'Uploading file...',
                                                                showLoading:
                                                                    true,
                                                              );
                                                              selectedUploadedFiles =
                                                                  selectedMedia
                                                                      .map((m) =>
                                                                          FFUploadedFile(
                                                                            name:
                                                                                m.storagePath.split('/').last,
                                                                            bytes:
                                                                                m.bytes,
                                                                            height:
                                                                                m.dimensions?.height,
                                                                            width:
                                                                                m.dimensions?.width,
                                                                            blurHash:
                                                                                m.blurHash,
                                                                          ))
                                                                      .toList();

                                                              downloadUrls =
                                                                  (await Future
                                                                          .wait(
                                                                selectedMedia
                                                                    .map(
                                                                  (m) async =>
                                                                      await uploadData(
                                                                          m.storagePath,
                                                                          m.bytes),
                                                                ),
                                                              ))
                                                                      .where((u) =>
                                                                          u !=
                                                                          null)
                                                                      .map((u) =>
                                                                          u!)
                                                                      .toList();
                                                            } finally {
                                                              ScaffoldMessenger
                                                                      .of(context)
                                                                  .hideCurrentSnackBar();
                                                              _model.isDataUploading =
                                                                  false;
                                                            }
                                                            if (selectedUploadedFiles
                                                                        .length ==
                                                                    selectedMedia
                                                                        .length &&
                                                                downloadUrls
                                                                        .length ==
                                                                    selectedMedia
                                                                        .length) {
                                                              setState(() {
                                                                _model.uploadedLocalFile =
                                                                    selectedUploadedFiles
                                                                        .first;
                                                                _model.uploadedFileUrl =
                                                                    downloadUrls
                                                                        .first;
                                                              });
                                                              showUploadMessage(
                                                                  context,
                                                                  'Success!');
                                                            } else {
                                                              setState(() {});
                                                              showUploadMessage(
                                                                  context,
                                                                  'Failed to upload data');
                                                              return;
                                                            }
                                                          }

                                                          if ((_model.textController
                                                                          .text !=
                                                                      '') ||
                                                              (_model.uploadedFileUrl !=
                                                                      '')) {
                                                            await widget
                                                                .chat!.reference
                                                                .update({
                                                              ...createChatsRecordData(
                                                                lastMessage:
                                                                    updateChatMessageStruct(
                                                                  ChatMessageStruct(
                                                                    timestamp:
                                                                        getCurrentTimestamp,
                                                                    authorID:
                                                                        currentUserUid,
                                                                    image: _model
                                                                        .uploadedFileUrl,
                                                                  ),
                                                                  clearUnsetFields:
                                                                      false,
                                                                ),
                                                              ),
                                                              ...mapToFirestore(
                                                                {
                                                                  'chat_messages':
                                                                      FieldValue
                                                                          .arrayUnion([
                                                                    getChatMessageFirestoreData(
                                                                      createChatMessageStruct(
                                                                        timestamp:
                                                                            getCurrentTimestamp,
                                                                        image: _model
                                                                            .uploadedFileUrl,
                                                                        authorID:
                                                                            currentUserUid,
                                                                        clearUnsetFields:
                                                                            false,
                                                                      ),
                                                                      true,
                                                                    )
                                                                  ]),
                                                                },
                                                              ),
                                                            });
                                                            setState(() {
                                                              _model
                                                                  .textController
                                                                  ?.clear();
                                                            });
                                                          } else {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Please type something...',
                                                                  style:
                                                                      TextStyle(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                                ),
                                                                duration: const Duration(
                                                                    milliseconds:
                                                                        4000),
                                                                backgroundColor:
                                                                    const Color(
                                                                        0x00000000),
                                                              ),
                                                            );
                                                          }
                                                        },
                                                        child: const Icon(
                                                          Icons
                                                              .add_circle_sharp,
                                                          color:
                                                              Color(0xFF87939C),
                                                          size: 18.0,
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 24.0,
                                                      child: VerticalDivider(
                                                        thickness: 1.0,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: TextFormField(
                                                        controller: _model
                                                            .textController,
                                                        focusNode: _model
                                                            .textFieldFocusNode,
                                                        onFieldSubmitted:
                                                            (_) async {
                                                          if (_model.textController
                                                                      .text !=
                                                                  '') {
                                                            await widget
                                                                .chat!.reference
                                                                .update({
                                                              ...createChatsRecordData(
                                                                lastMessage:
                                                                    updateChatMessageStruct(
                                                                  ChatMessageStruct(
                                                                    text: _model
                                                                        .textController
                                                                        .text,
                                                                    timestamp:
                                                                        getCurrentTimestamp,
                                                                    authorID:
                                                                        currentUserUid,
                                                                  ),
                                                                  clearUnsetFields:
                                                                      false,
                                                                ),
                                                              ),
                                                              ...mapToFirestore(
                                                                {
                                                                  'chat_messages':
                                                                      FieldValue
                                                                          .arrayUnion([
                                                                    getChatMessageFirestoreData(
                                                                      createChatMessageStruct(
                                                                        text: _model
                                                                            .textController
                                                                            .text,
                                                                        timestamp:
                                                                            getCurrentTimestamp,
                                                                        authorID:
                                                                            currentUserUid,
                                                                        clearUnsetFields:
                                                                            false,
                                                                      ),
                                                                      true,
                                                                    )
                                                                  ]),
                                                                },
                                                              ),
                                                            });
                                                            setState(() {
                                                              _model
                                                                  .textController
                                                                  ?.clear();
                                                            });
                                                          }
                                                        },
                                                        autofocus: true,
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .getText(
                                                            '73oh2w00' /* Type something... */,
                                                          ),
                                                          hintStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Outfit',
                                                                    color: const Color(
                                                                        0xFFBDBDBD),
                                                                  ),
                                                          enabledBorder:
                                                              const UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(
                                                                      4.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      4.0),
                                                            ),
                                                          ),
                                                          focusedBorder:
                                                              const UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(
                                                                      4.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      4.0),
                                                            ),
                                                          ),
                                                          errorBorder:
                                                              const UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(
                                                                      4.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      4.0),
                                                            ),
                                                          ),
                                                          focusedErrorBorder:
                                                              const UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(
                                                                      4.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      4.0),
                                                            ),
                                                          ),
                                                          contentPadding:
                                                              const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      0.0,
                                                                      0.0,
                                                                      5.0),
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium,
                                                        validator: _model
                                                            .textControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          if (_model.textController.text !=
                                                  '') {
                                            await widget.chat!.reference
                                                .update({
                                              ...createChatsRecordData(
                                                lastMessage:
                                                    updateChatMessageStruct(
                                                  ChatMessageStruct(
                                                    text: _model
                                                        .textController.text,
                                                    timestamp:
                                                        getCurrentTimestamp,
                                                    authorID: currentUserUid,
                                                  ),
                                                  clearUnsetFields: false,
                                                ),
                                              ),
                                              ...mapToFirestore(
                                                {
                                                  'chat_messages':
                                                      FieldValue.arrayUnion([
                                                    getChatMessageFirestoreData(
                                                      createChatMessageStruct(
                                                        text: _model
                                                            .textController
                                                            .text,
                                                        timestamp:
                                                            getCurrentTimestamp,
                                                        authorID:
                                                            currentUserUid,
                                                        clearUnsetFields: false,
                                                      ),
                                                      true,
                                                    )
                                                  ]),
                                                },
                                              ),
                                            });
                                            setState(() {
                                              _model.textController?.clear();
                                            });
                                          }
                                        },
                                        child: Container(
                                          width: 45.0,
                                          height: 45.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(400.0),
                                          ),
                                          child: const Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        2.0, 0.0, 0.0, 0.0),
                                                child: Icon(
                                                  Icons.send_rounded,
                                                  color: Color(0xFF87939C),
                                                  size: 18.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}
