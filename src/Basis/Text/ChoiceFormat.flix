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
    /// Represents a ChoiceFormat.
    /// "Immutable with Setter"
    ///
    pub enum ChoiceFormat(##java.text.ChoiceFormat)



}


mod Basis.Text.ChoiceFormat {

    use Basis.Text.ChoiceFormat
    use Basis.Text.ChoiceFormat.{ChoiceFormat}
   

    ///
    /// Returns a new ChoiceFormat.
    ///
    pub def new(pattern: String): ChoiceFormat =
        import new java.text.ChoiceFormat(String): ##java.text.ChoiceFormat \ {} as newChoiceFormat;
        ChoiceFormat(newChoiceFormat(pattern))

    ///
    /// Returns a new ChoiceFormat.
    ///
    pub def newWithChoices(limits: List[Float64], formats: List[String]): Result[String, ChoiceFormat] =
        Result.tryCatch(_ -> region rc {
            import new java.text.ChoiceFormat(Array[Float64, rc], Array[String, rc]): ##java.text.ChoiceFormat \ {} as newChoiceFormat;
            let limits1 = List.toArray(rc, limits);
            let formats1 = List.toArray(rc, formats);
            ChoiceFormat(newChoiceFormat(limits1, formats1))
        })


    pub def formatInt64(fmt: ChoiceFormat, n: Int64): Result[String, String] = 
        Result.tryCatch(_ -> {
            import java.text.ChoiceFormat.format(Int64): String \ {};
            let ChoiceFormat(fmt1) = fmt;
            format(fmt1, n)
        })

    pub def formatFloat64(fmt: ChoiceFormat, d: Float64): Result[String, String] =  
        Result.tryCatch(_ -> {
            import java.text.ChoiceFormat.format(Float64): String \ {};
            let ChoiceFormat(fmt1) = fmt;
            format(fmt1, d)
        })

    ///
    pub def toPattern(cf: ChoiceFormat): String =
        import java.text.ChoiceFormat.toPattern(): String \ {};
        let ChoiceFormat(cf1) = cf;
        toPattern(cf1)

}
