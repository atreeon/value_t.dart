// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Marking_UsingBuilt_FAIL.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$MarkingUnanswered extends MarkingUnanswered {
  @override
  final String fullWord;

  factory _$MarkingUnanswered([void updates(MarkingUnansweredBuilder b)]) =>
      (new MarkingUnansweredBuilder()..update(updates)).build();

  _$MarkingUnanswered._({this.fullWord}) : super._() {
    if (fullWord == null) {
      throw new BuiltValueNullFieldError('MarkingUnanswered', 'fullWord');
    }
  }

  @override
  MarkingUnanswered rebuild(void updates(MarkingUnansweredBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  MarkingUnansweredBuilder toBuilder() =>
      new MarkingUnansweredBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MarkingUnanswered && fullWord == other.fullWord;
  }

  @override
  int get hashCode {
    return $jf($jc(0, fullWord.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MarkingUnanswered')
          ..add('fullWord', fullWord))
        .toString();
  }
}

class MarkingUnansweredBuilder
    implements Builder<MarkingUnanswered, MarkingUnansweredBuilder> {
  _$MarkingUnanswered _$v;

  String _fullWord;
  String get fullWord => _$this._fullWord;
  set fullWord(String fullWord) => _$this._fullWord = fullWord;

  MarkingUnansweredBuilder();

  MarkingUnansweredBuilder get _$this {
    if (_$v != null) {
      _fullWord = _$v.fullWord;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MarkingUnanswered other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$MarkingUnanswered;
  }

  @override
  void update(void updates(MarkingUnansweredBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$MarkingUnanswered build() {
    final _$result = _$v ?? new _$MarkingUnanswered._(fullWord: fullWord);
    replace(_$result);
    return _$result;
  }
}

class _$MarkingCorrect extends MarkingCorrect {
  factory _$MarkingCorrect([void updates(MarkingCorrectBuilder b)]) =>
      (new MarkingCorrectBuilder()..update(updates)).build();

  _$MarkingCorrect._() : super._();

  @override
  MarkingCorrect rebuild(void updates(MarkingCorrectBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  MarkingCorrectBuilder toBuilder() =>
      new MarkingCorrectBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MarkingCorrect;
  }

  @override
  int get hashCode {
    return 928862225;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('MarkingCorrect').toString();
  }
}

class MarkingCorrectBuilder
    implements Builder<MarkingCorrect, MarkingCorrectBuilder> {
  _$MarkingCorrect _$v;

  MarkingCorrectBuilder();

  @override
  void replace(MarkingCorrect other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$MarkingCorrect;
  }

  @override
  void update(void updates(MarkingCorrectBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$MarkingCorrect build() {
    final _$result = _$v ?? new _$MarkingCorrect._();
    replace(_$result);
    return _$result;
  }
}

class _$MarkingIncorrect extends MarkingIncorrect {
  @override
  final List<String> infoMessages;
  @override
  final String answer;

  factory _$MarkingIncorrect([void updates(MarkingIncorrectBuilder b)]) =>
      (new MarkingIncorrectBuilder()..update(updates)).build();

  _$MarkingIncorrect._({this.infoMessages, this.answer}) : super._() {
    if (infoMessages == null) {
      throw new BuiltValueNullFieldError('MarkingIncorrect', 'infoMessages');
    }
    if (answer == null) {
      throw new BuiltValueNullFieldError('MarkingIncorrect', 'answer');
    }
  }

  @override
  MarkingIncorrect rebuild(void updates(MarkingIncorrectBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  MarkingIncorrectBuilder toBuilder() =>
      new MarkingIncorrectBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MarkingIncorrect &&
        infoMessages == other.infoMessages &&
        answer == other.answer;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, infoMessages.hashCode), answer.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MarkingIncorrect')
          ..add('infoMessages', infoMessages)
          ..add('answer', answer))
        .toString();
  }
}

class MarkingIncorrectBuilder
    implements Builder<MarkingIncorrect, MarkingIncorrectBuilder> {
  _$MarkingIncorrect _$v;

  List<String> _infoMessages;
  List<String> get infoMessages => _$this._infoMessages;
  set infoMessages(List<String> infoMessages) =>
      _$this._infoMessages = infoMessages;

  String _answer;
  String get answer => _$this._answer;
  set answer(String answer) => _$this._answer = answer;

  MarkingIncorrectBuilder();

  MarkingIncorrectBuilder get _$this {
    if (_$v != null) {
      _infoMessages = _$v.infoMessages;
      _answer = _$v.answer;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MarkingIncorrect other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$MarkingIncorrect;
  }

  @override
  void update(void updates(MarkingIncorrectBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$MarkingIncorrect build() {
    final _$result = _$v ??
        new _$MarkingIncorrect._(infoMessages: infoMessages, answer: answer);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
