/**
 * Use on class co indicate that validator needs to be generated
 */
class Valid {
  const Valid();
}

/**
 * The annotated element must be not-null
 */
class NotNull {
  const NotNull();
}

/**
 * The annotated element must be a string in email format
 */
class Email {
  const Email();
}

/**
 * The annotated element must be a not empty string
 */
class NotBlank {
  const NotBlank();
}

/**
 * The annotated element must be a string whose length must be between the specified boundaries (included).
 */
class Length {
  final int? min;
  final int? max;
  const Length({
    this.min,
    this.max
  });
}

/**
 * The annotated element size must be between the specified boundaries (included).
 */
class Size {
  final int? min;
  final int? max;
  const Size({
    this.min,
    this.max
  });
}

/**
 * The annotated element must be a string whose is not null
 */
class NotEmpty {
  const NotEmpty();
}
/**
 * The annotated element must be a number whose value must be higher or equal to the specified minimum.
 */
class Min {
  final double value;

  const Min(this.value);
}

/**
 * The annotated element must be a number whose value must be lower or equal to the specified maximum.
 */
class Max {
  final double value;

  const Max(this.value);
}
