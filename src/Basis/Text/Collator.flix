/*
 * Copyright 2022 Stephen Tetley
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
    /// Class / Represents a Collator.
    /// "Immutable after init"
    ///
    pub enum Collator(##java.text.Collator)
    

}

mod Basis.Text.Collator {
    

    use Locale
    use Locale.{Locale}
    
    use Basis.Text.Collator
    use Basis.Text.Collator.{Collator}
    use Basis.Text.Collator.DecompositionMode
    use Basis.Text.Collator.DecompositionMode.{NoDecomposition, CanonicalDecomposition, FullDecomposition}
    use Basis.Text.Collator.Strength
    use Basis.Text.Collator.Strength.{Identical, Primary, Secondary, Tertiary}
    
    
    // Note - Java's Collator dates from 1.1 and predates enums (1.5), I think the use of 
    // enums here is safe.

    pub enum DecompositionMode with Eq, Order, ToString, Hash {
        case NoDecomposition
        case CanonicalDecomposition
        case FullDecomposition
    }

    pub enum Strength with Eq, Order, ToString, Hash {
        case Identical
        case Primary
        case Secondary
        case Tertiary
    }


    def no_decomposition(): Int32 = 
        import static get java.text.Collator.NO_DECOMPOSITION: Int32 \ {} as get_NO_DECOMPOSITION;
        get_NO_DECOMPOSITION()

    def canonical_decomposition(): Int32 = 
        import static get java.text.Collator.CANONICAL_DECOMPOSITION: Int32 \ {} as get_CANONICAL_DECOMPOSITION;
        get_CANONICAL_DECOMPOSITION()

    def full_decomposition(): Int32 = 
        import static get java.text.Collator.FULL_DECOMPOSITION: Int32 \ {} as get_FULL_DECOMPOSITION;
        get_FULL_DECOMPOSITION()



    def identical(): Int32 = 
        import static get java.text.Collator.IDENTICAL: Int32 \ {} as get_IDENTICAL;
        get_IDENTICAL()

    def primary(): Int32 = 
        import static get java.text.Collator.PRIMARY: Int32 \ {} as get_PRIMARY;
        get_PRIMARY()

    def secondary(): Int32 = 
        import static get java.text.Collator.SECONDARY: Int32 \ {} as get_SECONDARY;
        get_SECONDARY()

    def tertiary(): Int32 =         
        import static get java.text.Collator.TERTIARY: Int32 \ {} as get_TERTIARY;
        get_TERTIARY()

    def decompositionModeToJava(x: DecompositionMode): Int32 =
        match x {
            case NoDecomposition        => no_decomposition()
            case CanonicalDecomposition => canonical_decomposition()
            case FullDecomposition      => full_decomposition()
        }


    /// Fallback or bug! ?
    def decompositionModeFromJava(i: Int32): DecompositionMode =
        match i {
            case n if n == no_decomposition()           => NoDecomposition
            case n if n == canonical_decomposition()    => CanonicalDecomposition
            case n if n == full_decomposition()         => FullDecomposition
            case n                                      => bug!("decompositionModeFromJava: ${n}")
        }


    pub def strengthToJava(x: Strength): Int32 =
        match x {
            case Identical => identical()
            case Primary   => primary()
            case Secondary => secondary()
            case Tertiary  => tertiary()
        }

    /// Warning - I am not sure each enum has a distinct int value in Java land...
    def strengthFromJava(i: Int32): Strength =
        match i {
            case n if n == identical()  => Identical
            case n if n == primary()    => Primary
            case n if n == secondary()  => Secondary
            case n if n == tertiary()   => Tertiary
            case n                      => bug!("strengthfromJava: ${n}")
        }



    ///
    /// Get a Collator with the locale of the JVM.
    ///
    pub def getInstance(): Collator \ IO =
        import static java.text.Collator.getInstance(): ##java.text.Collator \ IO;
        let c = getInstance();
        Collator(c)



    pub type alias CollatorBuilder = ##java.text.Collator -> Unit \ IO

    ///
    /// Get a Collator with the locale of the JVM.
    ///
    pub def getInstanceWith(build: CollatorBuilder): Collator \ IO =
        import static java.text.Collator.getInstance(): ##java.text.Collator \ IO;
        let c1 = getInstance();
        build(c1);
        Collator(c1)

    pub def getInstanceWithLocale(loc: Locale): Collator =
        import static java.text.Collator.getInstance(##java.util.Locale): ##java.text.Collator \ {};
        let Locale(loc1) = loc;
        let c1 = getInstance(loc1);
        Collator(c1)

    pub def getInstanceWithLocaleWith(loc: Locale, build: CollatorBuilder): Collator \ IO =
        import static java.text.Collator.getInstance(##java.util.Locale): ##java.text.Collator \ {};
        let Locale(loc1) = loc;
        let c1 = getInstance(loc1);
        build(c1);
        Collator(c1)





    ///
    /// Test equality of strings `s1` and `s2` with the collator `col``.
    ///
    pub def equals(s1: String, s2: String, col: Collator): Bool =
        import java.text.Collator.equals(String, String): Bool \ {};
        let Collator(col1) = col;
        equals(col1, s1, s2)

    ///
    /// Compare strings `s1` and `s2` with the collator `col`.
    ///
    pub def compare(s1: String, s2: String, col: Collator): Comparison =
        import java.text.Collator.compare(String, String): Int32 \ {};
        let Collator(col1) = col;
        compare(col1, s1, s2) |> Comparison.fromInt32


    pub def getDecomposition(c: Collator): DecompositionMode =
        import java.text.Collator.getDecomposition(): Int32 \ {};
        let Collator(c1) = c;
        getDecomposition(c1) |> decompositionModeFromJava


    pub def getStrength(c: Collator): Strength =
        import java.text.Collator.getStrength(): Int32 \ {};
        let Collator(c1) = c;
        getStrength(c1) |> strengthFromJava



    /// Imperative, but not run after initialization
    pub def setDecompositionMode!(mode: DecompositionMode): CollatorBuilder = col -> 
        import java.text.Collator.setDecomposition(Int32): Unit \ IO;
        let mode1 = decompositionModeToJava(mode);
        setDecomposition(col, mode1)


    /// Imperative, but not run after initialization
    pub def setStrength!(strength: Strength): CollatorBuilder = col -> 
        import java.text.Collator.setStrength(Int32): Unit \ IO;
        let strength1 = strengthToJava(strength);
        setStrength(col, strength1)

}
