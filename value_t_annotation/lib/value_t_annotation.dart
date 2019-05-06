///value type - for annotation
class ValueT {
  final bool isAbstract;

  ///Sub property names for CopyWith function
  final List<String> props;
  const ValueT([this.isAbstract = false, this.props = null]);
}

class DefaultValue {
  final dynamic value;
  const DefaultValue(this.value);
}
