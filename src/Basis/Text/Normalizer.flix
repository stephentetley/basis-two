/*
 * Copyright 2020 Stephen Tetley
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


mod Basis.Text.Normalizer {

    use Basis.Text.Normalizer.NormalizerForm
    use Basis.Text.Normalizer.NormalizerForm.{Nfc, Nfd, Nfkc, Nfkd}

    ///
    pub enum NormalizerForm with Eq, Order, ToString, Hash {
        case Nfc
        case Nfd
        case Nfkc
        case Nfkd
    }


    def nfc(): ##java.text.Normalizer$Form = 
        import static get java.text.Normalizer$Form.NFC: ##java.text.Normalizer$Form \ {} as get_NFC;
        get_NFC()

    def nfd(): ##java.text.Normalizer$Form = 
        import static get java.text.Normalizer$Form.NFD: ##java.text.Normalizer$Form \ {} as get_NFD;
        get_NFD()

    def nfkc(): ##java.text.Normalizer$Form = 
        import static get java.text.Normalizer$Form.NFKC: ##java.text.Normalizer$Form \ {} as get_NFKC;
        get_NFKC()

    def nfkd(): ##java.text.Normalizer$Form = 
        import static get java.text.Normalizer$Form.NFKD: ##java.text.Normalizer$Form \ {} as get_NFKD;
        get_NFKD()


    def normalizerFormToJava(x: NormalizerForm): ##java.text.Normalizer$Form =
        match x {
            case Nfc    => nfc()
            case Nfd    => nfd()
            case Nfkc   => nfkc()
            case Nfkd   => nfkd()
        }


    pub def normalize(nform: NormalizerForm, src: String): Result[String, String] =
        Result.tryCatch(_ -> {
            import static java.text.Normalizer.normalize(##java.lang.CharSequence, ##java.text.Normalizer$Form): String \ {};
            let nform1 = normalizerFormToJava(nform);
            normalize(unchecked_cast(src as ##java.lang.CharSequence), nform1)
        })

    pub def isNormalized(nform: NormalizerForm, src: String): Result[String, Bool] =
        Result.tryCatch(_ -> {
            import static java.text.Normalizer.isNormalized(##java.lang.CharSequence, ##java.text.Normalizer$Form): Bool \ {};            
            let nform1 = normalizerFormToJava(nform);
            isNormalized(unchecked_cast(src as ##java.lang.CharSequence), nform1)
        })

}
