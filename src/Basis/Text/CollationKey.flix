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
    

    pub enum CollationKey(##java.text.CollationKey)

    instance ToString[CollationKey] {
        pub def toString(x: CollationKey): String = 
            Basis.Text.CollationKey.toString(x)
    }

    instance Eq[CollationKey] {
        pub def eq(x: CollationKey, y: CollationKey): Bool = 
            Basis.Text.CollationKey.equals(x, y)
    }

    instance Order[CollationKey] {
        pub def compare(x: CollationKey, y: CollationKey): Comparison =
            Basis.Text.CollationKey.compareTo(x, y) |> Comparison.fromInt32
    }

    instance Hash[CollationKey] {
        pub def hash(x: CollationKey): Int32 = 
            Basis.Text.CollationKey.hashCode(x)
    }

}

mod Basis.Text.CollationKey {
    
    use Basis.Text.CollationKey
    use Basis.Text.CollationKey.{CollationKey}

    pub def toString(c: CollationKey): String =
        import java.text.CollationKey.toString(): String \ {};
        let CollationKey(c1) = c;
        toString(c1)

    pub def equals(x: CollationKey, y: CollationKey): Bool =
        import java.text.CollationKey.equals(##java.lang.Object): Bool \ {};
        let CollationKey(x1) = x;
        let CollationKey(y1) = y;
        equals(x1, checked_cast(y1))

    pub def hashCode(c: CollationKey): Int32 =
        import java.text.CollationKey.hashCode(): Int32 \ {};
        let CollationKey(c1) = c;
        hashCode(c1)

    pub def compareTo(x: CollationKey, y: CollationKey): Int32 =
        import java.text.CollationKey.compareTo(##java.text.CollationKey): Int32 \ {};
        let CollationKey(x1) = x;
        let CollationKey(y1) = y;
        compareTo(x1, y1)

    pub def getSourceString(ck: CollationKey): String = 
        import java.text.CollationKey.getSourceString(): String \ {};
        let CollationKey(ck1) = ck;
        getSourceString(ck1)

    // toByteArray...
}
