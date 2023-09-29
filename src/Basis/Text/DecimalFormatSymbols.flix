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
    /// Represents a DecimalFormatSymbols object.
    /// "Immutable with Setter"
    ///
    pub enum DecimalFormatSymbols(##java.text.DecimalFormatSymbols)
    

    instance Eq[DecimalFormatSymbols] {
        pub def eq(x: DecimalFormatSymbols, y: DecimalFormatSymbols): Bool = 
            Basis.Text.DecimalFormatSymbols.equals(x, y)
    }

    instance Hash[DecimalFormatSymbols] {
        pub def hash(x: DecimalFormatSymbols): Int32 = 
            Basis.Text.DecimalFormatSymbols.hashCode(x)
    }

}


mod Basis.Text.DecimalFormatSymbols {

    use Basis.Text.DecimalFormatSymbols
    use Basis.Text.DecimalFormatSymbols.{DecimalFormatSymbols}
    use Basis.Text.DecimalFormatSymbols.DecimalFormatSymbolsBuilder.{DecimalFormatSymbolsBuilder}

    use Basis.Util.Currency
    use Basis.Util.Currency.{Currency}
    use Locale.{Locale}

    pub enum DecimalFormatSymbolsBuilder[r: Region](##java.text.DecimalFormatSymbols -> Result[String, Unit] \ r)

    pub def andThen(b1: DecimalFormatSymbolsBuilder[r], b2: DecimalFormatSymbolsBuilder[r]): DecimalFormatSymbolsBuilder[r] = 
        DecimalFormatSymbolsBuilder(build -> 
            let DecimalFormatSymbolsBuilder(f1) = b1;
            let DecimalFormatSymbolsBuilder(f2) = b2;
            match f1(build) {
                case Ok()   => f2(build)
                case Err(e) => Err(e)
            }
            
        )

    ///
    /// Returns a new DecimalFormatSymbols object.
    /// Uses the (implicit) default locale, hence in IO
    ///
    pub def new(): DecimalFormatSymbols \ IO =
        import new java.text.DecimalFormatSymbols(): ##java.text.DecimalFormatSymbols \ IO as newDecimalFormatSymbols;
        DecimalFormatSymbols(newDecimalFormatSymbols())

    ///
    /// Returns a new DecimalFormatSymbols object.
    /// Uses the (implicit) default locale, hence in IO
    ///
    pub def newWith(_: Region[r], build: DecimalFormatSymbolsBuilder[r]): Result[String, DecimalFormatSymbols] \ IO =
        import new java.text.DecimalFormatSymbols(): ##java.text.DecimalFormatSymbols \ IO as newDecimalFormatSymbols;
        let dfs = newDecimalFormatSymbols();
        let DecimalFormatSymbolsBuilder(build1) = build;
        build1(dfs) |> Result.map(_ -> DecimalFormatSymbols(dfs))


    ///
    /// Returns a new DecimalFormatSymbols object derived from the locale.
    ///
    pub def newWithLocale(loc: Locale): Result[String, DecimalFormatSymbols] =
        Result.tryCatch( _ -> {
            import new java.text.DecimalFormatSymbols(##java.util.Locale): ##java.text.DecimalFormatSymbols \ {} as newDecimalFormatSymbols;
            let Locale(loc1) = loc;
            DecimalFormatSymbols(newDecimalFormatSymbols(loc1))
        })


    pub def equals(x: DecimalFormatSymbols, y: DecimalFormatSymbols): Bool =
        import java.text.DecimalFormatSymbols.equals(##java.lang.Object): Bool \ {};
        let DecimalFormatSymbols(x1) = x;
        let DecimalFormatSymbols(y1) = y;
        equals(x1, checked_cast(y1))

    pub def hashCode(dfs: DecimalFormatSymbols): Int32 =
        import java.text.DecimalFormatSymbols.hashCode(): Int32 \ {};
        let DecimalFormatSymbols(dfs1) = dfs;
        hashCode(dfs1)


    /// This marshals okay...
    pub def getAvailableLocales(): List[Locale] \ IO = region rc {
        import static java.text.DecimalFormatSymbols.getAvailableLocales(): Array[##java.util.Locale, rc] \ IO ;
        let _ = Array#{} @ rc;
        getAvailableLocales() |> Array.toList |> List.map(Locale)
    }


    pub def getInstance(): DecimalFormatSymbols \ IO = 
        import static java.text.DecimalFormatSymbols.getInstance(): ##java.text.DecimalFormatSymbols \ IO;
        DecimalFormatSymbols(getInstance())

    pub def getInstanceWith(_: Region[r], build: DecimalFormatSymbolsBuilder[r]): Result[String, DecimalFormatSymbols] \ {IO, r} = 
        import static java.text.DecimalFormatSymbols.getInstance(): ##java.text.DecimalFormatSymbols \ IO;
        let dfs1 = getInstance();
        let DecimalFormatSymbolsBuilder(build1) = build;
        build1(dfs1) |> Result.map(_ -> DecimalFormatSymbols(dfs1))


    pub def getInstanceWithLocale(loc: Locale): Result[String, DecimalFormatSymbols] = 
        Result.tryCatch(_ -> {
            import static java.text.DecimalFormatSymbols.getInstance(##java.util.Locale): ##java.text.DecimalFormatSymbols \ {};
            let Locale(loc1) = loc;
            DecimalFormatSymbols(getInstance(loc1))
        })

    pub def getInstanceWithLocaleWith(_: Region[r], loc: Locale, build: DecimalFormatSymbolsBuilder[r]): Result[String, DecimalFormatSymbols] \ r = 
        try {
            import static java.text.DecimalFormatSymbols.getInstance(##java.util.Locale): ##java.text.DecimalFormatSymbols \ {};
            let Locale(loc1) = loc;
            let DecimalFormatSymbolsBuilder(build1) = build;    
            let dfs = getInstance(loc1);
            build1(dfs) |> Result.map(_ -> DecimalFormatSymbols(dfs))
        } catch {
            case e: ##java.lang.Exception =>
                import java.lang.Throwable.getMessage(): String \ {};
                Err(getMessage(e))
        }

    pub def getCurrency(dfs: DecimalFormatSymbols): Option[Currency] =
        import java.text.DecimalFormatSymbols.getCurrency(): ##java.util.Currency \ {};
        let DecimalFormatSymbols(dfs1) = dfs;
        getCurrency(dfs1) |> Object.toOption |> Option.map(c -> Currency(c))

    pub def getCurrencySymbol(dfs: DecimalFormatSymbols): String = 
        import java.text.DecimalFormatSymbols.getCurrencySymbol(): String \ {};
        let DecimalFormatSymbols(dfs1) = dfs;
        getCurrencySymbol(dfs1)

    pub def getDecimalSeparator(dfs: DecimalFormatSymbols): Char = 
        import java.text.DecimalFormatSymbols.getDecimalSeparator(): Char \ {};
        let DecimalFormatSymbols(dfs1) = dfs;
        getDecimalSeparator(dfs1)


    pub def getDigit(dfs: DecimalFormatSymbols): Char = 
        import java.text.DecimalFormatSymbols.getDigit(): Char \ {};
        let DecimalFormatSymbols(dfs1) = dfs;
        getDigit(dfs1)

    pub def getExponentSeparator(dfs: DecimalFormatSymbols): String = 
        import java.text.DecimalFormatSymbols.getExponentSeparator(): String \ {};
        let DecimalFormatSymbols(dfs1) = dfs;
        getExponentSeparator(dfs1)

    // // Java 15

    // // pub def getGroupingSeparator(dfs: DecimalFormatSymbols): Char = 
    // //     import java.text.DecimalFormatSymbols.getGroupingSeparator(): Char \ {};
    // //     let DecimalFormatSymbols(dfs1) = dfs;
    // //     getGroupingSeparator(dfs1)

    pub def getInfinity(dfs: DecimalFormatSymbols): String = 
        import java.text.DecimalFormatSymbols.getInfinity(): String \ {};
        let DecimalFormatSymbols(dfs1) = dfs;
        getInfinity(dfs1)


    pub def getInternationalCurrencySymbol(dfs: DecimalFormatSymbols): String = 
        import java.text.DecimalFormatSymbols.getInternationalCurrencySymbol(): String \ {};
        let DecimalFormatSymbols(dfs1) = dfs;
        getInternationalCurrencySymbol(dfs1)

    pub def getMinusSign(dfs: DecimalFormatSymbols): Char = 
        import java.text.DecimalFormatSymbols.getMinusSign(): Char \ {};
        let DecimalFormatSymbols(dfs1) = dfs;
        getMinusSign(dfs1)

    pub def getMonetaryDecimalSeparator(dfs: DecimalFormatSymbols): Char = 
        import java.text.DecimalFormatSymbols.getMonetaryDecimalSeparator(): Char \ {};
        let DecimalFormatSymbols(dfs1) = dfs;
        getMonetaryDecimalSeparator(dfs1)   

    // // Java 15
    // // pub def getMonetaryGroupingSeparator(dfs: DecimalFormatSymbols): Char = 
    // //     import java.text.DecimalFormatSymbols.getMonetaryGroupingSeparator(): Char \ {};
    // //     let DecimalFormatSymbols(dfs1) = dfs;
    // //     getMonetaryGroupingSeparator(dfs1)

    pub def getNaN(dfs: DecimalFormatSymbols): String = 
        import java.text.DecimalFormatSymbols.getNaN(): String \ {};
        let DecimalFormatSymbols(dfs1) = dfs;
        getNaN(dfs1)

    pub def getPatternSeparator(dfs: DecimalFormatSymbols): Char = 
        import java.text.DecimalFormatSymbols.getPatternSeparator(): Char \ {};
        let DecimalFormatSymbols(dfs1) = dfs;
        getPatternSeparator(dfs1)

    pub def getPercent(dfs: DecimalFormatSymbols): Char = 
        import java.text.DecimalFormatSymbols.getPercent(): Char \ {};
        let DecimalFormatSymbols(dfs1) = dfs;
        getPercent(dfs1)

    pub def getPerMill(dfs: DecimalFormatSymbols): Char = 
        import java.text.DecimalFormatSymbols.getPerMill(): Char \ {};
        let DecimalFormatSymbols(dfs1) = dfs;
        getPerMill(dfs1)


    pub def getZeroDigit(dfs: DecimalFormatSymbols): Char = 
        import java.text.DecimalFormatSymbols.getZeroDigit(): Char \ {};
        let DecimalFormatSymbols(dfs1) = dfs;
        getZeroDigit(dfs1)        


    /// Builder Setters

        
    pub def setCurrency!(c: Currency): DecimalFormatSymbolsBuilder[r] = 
        DecimalFormatSymbolsBuilder(dfs -> 
            Result.tryCatch(_ -> {
                import java.text.DecimalFormatSymbols.setCurrency(##java.util.Currency): Unit \ r;
                let Currency(c1) = c;
                setCurrency(dfs, c1)
            })
        )

    pub def setCurrencySymbol!(s: String): DecimalFormatSymbolsBuilder[r] = 
        DecimalFormatSymbolsBuilder(dfs ->
            Result.tryCatch(_ -> {
                import java.text.DecimalFormatSymbols.setCurrencySymbol(String): Unit \ r;
                setCurrencySymbol(dfs, s)
            })
        )

    pub def setDecimalSeparator!(c: Char): DecimalFormatSymbolsBuilder[r] = 
        DecimalFormatSymbolsBuilder(dfs ->
            Result.tryCatch(_ -> {
                import java.text.DecimalFormatSymbols.setDecimalSeparator(Char): Unit \ r;
                setDecimalSeparator(dfs, c)
            })
        )

    pub def setDigit!(c: Char): DecimalFormatSymbolsBuilder[r] = 
        DecimalFormatSymbolsBuilder(dfs ->
            Result.tryCatch(_ -> {
                import java.text.DecimalFormatSymbols.setDigit(Char): Unit \ r;
                setDigit(dfs, c)
            })
        )

    pub def setExponentSeparator!(s: String): DecimalFormatSymbolsBuilder[r] = 
        DecimalFormatSymbolsBuilder(dfs ->
            Result.tryCatch(_ -> {
                import java.text.DecimalFormatSymbols.setExponentSeparator(String): Unit \ r;
                setExponentSeparator(dfs, s)
            })
        )

    pub def setInfinity!(s: String): DecimalFormatSymbolsBuilder[r] = 
        DecimalFormatSymbolsBuilder(dfs ->
            Result.tryCatch(_ -> {
                import java.text.DecimalFormatSymbols.setInfinity(String): Unit \ r;
                setInfinity(dfs, s)
            })
        )

    pub def setInternationalCurrencySymbol!(s: String): DecimalFormatSymbolsBuilder[r] = 
        DecimalFormatSymbolsBuilder(dfs ->
            Result.tryCatch(_ -> {
                import java.text.DecimalFormatSymbols.setInternationalCurrencySymbol(String): Unit \ r;
                setInternationalCurrencySymbol(dfs, s)
            })
        )

    pub def setMinusSign!(c: Char): DecimalFormatSymbolsBuilder[r] = 
        DecimalFormatSymbolsBuilder(dfs ->
            Result.tryCatch(_ -> {
                import java.text.DecimalFormatSymbols.setMinusSign(Char): Unit \ r;
                setMinusSign(dfs, c)
            })
        )

    pub def setMonetaryDecimalSeparator!(c: Char): DecimalFormatSymbolsBuilder[r] = 
        DecimalFormatSymbolsBuilder(dfs ->
            Result.tryCatch(_ -> {
                import java.text.DecimalFormatSymbols.setMonetaryDecimalSeparator(Char): Unit \ r;
                setMonetaryDecimalSeparator(dfs, c)
            })
        )

    pub def setNaN!(s: String): DecimalFormatSymbolsBuilder[r] = 
        DecimalFormatSymbolsBuilder(dfs ->
            Result.tryCatch(_ -> {
                import java.text.DecimalFormatSymbols.setNaN(String): Unit \ r;
                setNaN(dfs, s)
            })
        )

    pub def setPatternSeparator!(c: Char): DecimalFormatSymbolsBuilder[r] = 
        DecimalFormatSymbolsBuilder(dfs ->
            Result.tryCatch(_ -> {
                import java.text.DecimalFormatSymbols.setPatternSeparator(Char): Unit \ r;
                setPatternSeparator(dfs, c)
            })
        )

    pub def setPercent!(c: Char): DecimalFormatSymbolsBuilder[r] = 
        DecimalFormatSymbolsBuilder(dfs ->
            Result.tryCatch(_ -> {
                import java.text.DecimalFormatSymbols.setPercent(Char): Unit \ r;
                setPercent(dfs, c)
            })
        )

    pub def setPerMill!(c: Char): DecimalFormatSymbolsBuilder[r] = 
        DecimalFormatSymbolsBuilder(dfs ->
            Result.tryCatch(_ -> {
                import java.text.DecimalFormatSymbols.setPerMill(Char): Unit \ r;
                setPerMill(dfs, c)
            })
        )

    pub def setZeroDigit!(c: Char): DecimalFormatSymbolsBuilder[r] = 
        DecimalFormatSymbolsBuilder(dfs ->
            Result.tryCatch(_ -> {
                import java.text.DecimalFormatSymbols.setZeroDigit(Char): Unit \ r;
                setZeroDigit(dfs, c)
            })
        )

}
