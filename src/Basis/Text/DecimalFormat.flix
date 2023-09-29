/*
 * Copyright 2023 Stephen Tetley
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

mod Basis.Text {

    ///
    /// Represents a DecimalFormat.
    /// "Immutable after init"
    ///
    pub enum DecimalFormat(##java.text.DecimalFormat)

    instance Hash[DecimalFormat] {
        pub def hash(x: DecimalFormat): Int32 = 
            Basis.Text.DecimalFormat.hashCode(x)
    }


}


mod Basis.Text.DecimalFormat {

    use Basis.Text.DecimalFormat.{DecimalFormat}
    use Basis.Text.DecimalFormat.DecimalFormatBuilder.{DecimalFormatBuilder}

    use Basis.Util.Currency
    use Basis.Util.Currency.{Currency}


    pub enum DecimalFormatBuilder[r: Region](##java.text.DecimalFormat -> Unit \ r)


    pub def andThen(b1: DecimalFormatBuilder[r], b2: DecimalFormatBuilder[r]): DecimalFormatBuilder[r] = 
        DecimalFormatBuilder(build -> 
            let DecimalFormatBuilder(f1) = b1;
            let DecimalFormatBuilder(f2) = b2;
            f1(build);
            f2(build)
        )

    ///
    /// Create a DecimalFormat with the default format locale of the JVM.
    ///
    pub def new(): DecimalFormat \ IO =
        import new java.text.DecimalFormat(): ##java.text.DecimalFormat \ IO as newDecimalFormatBuilder;
        DecimalFormat(newDecimalFormatBuilder())

    ///
    /// Create a DecimalFormat with the builder.
    ///
    pub def newWith(_: Region[r], build: DecimalFormatBuilder[r]): DecimalFormat \ r =
        import new java.text.DecimalFormat(): ##java.text.DecimalFormat \ {} as newDecimalFormatBuilder;
        let df1 = newDecimalFormatBuilder();
        let DecimalFormatBuilder(build1) = build;
        build1(df1);
        DecimalFormat(df1)

    pub def hashCode(df: DecimalFormat): Int32 =
        import java.text.DecimalFormat.hashCode(): Int32 \ {};
        let DecimalFormat(df1) = df;
        hashCode(df1)


    pub def formatInt64(fmt: DecimalFormat, n: Int64): Result[String, String] = 
        Result.tryCatch(_ -> {
            import java.text.NumberFormat.format(Int64): String \ {};
            let DecimalFormat(fmt1) = fmt;
            format(checked_cast(fmt1), n)
        })

    pub def formatFloat64(fmt: DecimalFormat, d: Float64): Result[String, String] =  
        Result.tryCatch(_ -> {
            import java.text.NumberFormat.format(Float64): String \ {};
            let DecimalFormat(fmt1) = fmt;
            format(checked_cast(fmt1), d)
        })


    pub def parseInt64(fmt: DecimalFormat, s: String): Result[String, Int64] = 
        Result.tryCatch(_ -> {
            import java.text.NumberFormat.parse(String): ##java.lang.Number \ {};
            import java.lang.Number.longValue(): Int64 \ {};
            let DecimalFormat(fmt1) = fmt;
            parse(checked_cast(fmt1), s) |> longValue
        })


    pub def parseFloat64(fmt: DecimalFormat, s: String): Result[String, Float64] = 
        Result.tryCatch(_ -> {
            import java.text.NumberFormat.parse(String): ##java.lang.Number \ {};
            import java.lang.Number.doubleValue(): Float64 \ {};
            let DecimalFormat(fmt1) = fmt;
            parse(checked_cast(fmt1), s) |> doubleValue
        })


    ///
    pub def toPattern(df: DecimalFormat): String =
        import java.text.DecimalFormat.toPattern(): String \ {};
        let DecimalFormat(df1) = df;
        toPattern(df1)



    ///
    pub def toLocalizedPattern(df: DecimalFormat): String =
        import java.text.DecimalFormat.toLocalizedPattern(): String \ {};
        let DecimalFormat(df1) = df;
        toLocalizedPattern(df1)


    pub def getCurrency(df: DecimalFormat): Result[String, Currency] =
        Result.tryCatch(_ -> {
            import java.text.DecimalFormat.getCurrency(): ##java.util.Currency \ {};
            let DecimalFormat(df1) = df;
            getCurrency(df1) |> Currency
        })



    /// Imperative, but not run after initialization
    pub def setCurrency!(currency: Currency): DecimalFormatBuilder[r] = 
        DecimalFormatBuilder(df -> 
            import java.text.DecimalFormat.setCurrency(##java.util.Currency): Unit \ r;
            let Currency(currency1) = currency;
            setCurrency(df, currency1)
        )

    pub def setDecimalSeparatorAlwaysShown!(shown: Bool): DecimalFormatBuilder[r] = 
        DecimalFormatBuilder(df -> 
            import java.text.DecimalFormat.setDecimalSeparatorAlwaysShown(Bool): Unit \ r;
            setDecimalSeparatorAlwaysShown(df, shown)
        )

}
