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


mod Basis.IO {

    pub enum ByteOrder with Eq, Order, ToString, Sendable {
        case BigEndian
        case LittleEndian
    }

}

mod Basis.IO.ByteOrder {

    use Basis.IO.ByteOrder
    use Basis.IO.ByteOrder.{BigEndian, LittleEndian}

    pub def byteOrderToJava(bo: ByteOrder): ##java.nio.ByteOrder = 
        import static get java.nio.ByteOrder.BIG_ENDIAN: ##java.nio.ByteOrder \ {} as get_BIG_ENDIAN;
        import static get java.nio.ByteOrder.LITTLE_ENDIAN: ##java.nio.ByteOrder \ {} as get_LITTLE_ENDIAN;
        match bo {
            case BigEndian    => get_BIG_ENDIAN()
            case LittleEndian => get_LITTLE_ENDIAN()
        }

    /// Not an Enum in Java.
    def primEquals(x: ##java.nio.ByteOrder, y: ##java.nio.ByteOrder): Bool =
        import java.lang.Object.equals(##java.lang.Object): Bool \ {};
        let x1 = checked_cast(x);
        let y1 = checked_cast(y);
        equals(x1, y1)

    pub def byteOrderFromJava(nbo: ##java.nio.ByteOrder): ByteOrder = 
        import static get java.nio.ByteOrder.BIG_ENDIAN: ##java.nio.ByteOrder \ {} as get_BIG_ENDIAN;
        import static get java.nio.ByteOrder.LITTLE_ENDIAN: ##java.nio.ByteOrder \ {} as get_LITTLE_ENDIAN;
        match nbo {
            case x1 if primEquals(x1, get_BIG_ENDIAN())    => BigEndian
            case x1 if primEquals(x1, get_LITTLE_ENDIAN()) => LittleEndian
            case _                                         => bug!("byteOrderFromJava")
        }



    pub def nativeOrder(): ByteOrder \ IO = 
        import static java.nio.ByteOrder.nativeOrder(): ##java.nio.ByteOrder \ IO;
        nativeOrder() |> byteOrderFromJava


}
