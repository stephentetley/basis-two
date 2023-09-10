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

mod Basis.Util {


    ///
    /// Represents a Java Currency.
    /// Immutable 
    pub enum Currency(##java.util.Currency)

    /// Note - Currency is an oddity because a currency is immutable, but there are no Currency 
    /// constructors (in Java), only `getInstance` static methods.
    /// 

    instance ToString[Currency] {
        pub def toString(x: Currency): String = 
            Basis.Util.Currency.toString(x)
    }

    instance Eq[Currency] {
        pub def eq(x: Currency, y: Currency): Bool = 
            Basis.Util.Currency.equals(x, y)
    }

    instance Hash[Currency] {
        pub def hash(x: Currency): Int32 = 
            Basis.Util.Currency.hashCode(x)
    }


    instance Order[Currency] {
        pub def compare(x: Currency, y: Currency): Comparison = 
            Order.compare(Basis.Util.Currency.getNumericCode(x), Basis.Util.Currency.getNumericCode(y))
    }


}



mod Basis.Util.Currency {

    use Basis.Util.Currency
    use Basis.Util.Currency.{Currency}

    use Locale.{Locale}
    

    pub def toString(c: Currency): String =
        import java.util.Currency.toString(): String \ {};
        let Currency(c1) = c;
        toString(c1)

    pub def equals(x: Currency, y: Currency): Bool =
        import java.util.Currency.equals(##java.lang.Object): Bool \ {};
        let Currency(x1) = x;
        let Currency(y1) = y;
        equals(x1, checked_cast(y1))

    pub def hashCode(c: Currency): Int32 =
        import java.util.Currency.hashCode(): Int32 \ {};
        let Currency(c1) = c;
        hashCode(c1)

    pub def getAvailableCurrencies(): Set[Currency] \ IO = region rc {
        import static java.util.Currency.getAvailableCurrencies(): ##java.util.Set \ IO ;
        import java.util.Set.iterator(): ##java.util.Iterator \ rc;
        getAvailableCurrencies() 
            |> iterator 
            |> Adaptor.fromIterator(rc, Proxy.Proxy: Proxy[##java.util.Currency]) 
            |> Iterator.foldLeft((s, c1) -> Set.insert(Currency(c1), s), Set.empty())

    }

    pub def getInstance(code: String): Result[String, Currency] \ IO = 
        Result.tryCatch(_ -> {
            import static java.util.Currency.getInstance(String): ##java.util.Currency \ IO;
            getInstance(code) |> Currency
        })

    pub def getInstanceWithLocale(loc: Locale): Result[String, Currency] \ IO = 
        Result.tryCatch(_ -> {
            import static java.util.Currency.getInstance(##java.util.Locale): ##java.util.Currency \ IO;
            let Locale(loc1) = loc;
            getInstance(loc1) |> Currency
        })

    pub def getCurrencyCode(cur: Currency): String = 
        import java.util.Currency.getCurrencyCode(): String \ {};
        let Currency(cur1) = cur;
        getCurrencyCode(cur1)

    pub def getNumericCode(cur: Currency): Int32 = 
        import java.util.Currency.getNumericCode(): Int32 \ {};
        let Currency(cur1) = cur;
        getNumericCode(cur1)

    pub def getDisplayName(cur: Currency): String = 
        import java.util.Currency.getDisplayName(): String \ {};
        let Currency(cur1) = cur;
        getDisplayName(cur1)

    pub def getSymbol(cur: Currency): String = 
        import java.util.Currency.getSymbol(): String \ {};
        let Currency(cur1) = cur;
        getSymbol(cur1)

    pub def getSymbolWithLocale(loc: Locale, cur: Currency): String = 
        import java.util.Currency.getSymbol(##java.util.Locale): String \ {};
        let Currency(cur1) = cur;
        let Locale(loc1) = loc;
        getSymbol(cur1, loc1)

}
