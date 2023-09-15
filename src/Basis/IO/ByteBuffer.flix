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

    ///
    /// Represents a FilePath.
    /// Interface / Immutable
    pub enum ByteBuffer[_: Region](##java.nio.ByteBuffer)

}

mod Basis.IO.ByteBuffer {


    use Basis.IO.ByteBuffer
    use Basis.IO.ByteBuffer.{ByteBuffer}
    use Basis.IO.ByteOrder
    


    ///
    /// Allocate a ByteBuffer.
    ///
    pub def allocate(_: Region[r], capacity: Int32): Result[String, ByteBuffer[r]] \ r =
        Result.tryCatch(_ -> {
            import static java.nio.ByteBuffer.allocate(Int32): ##java.nio.ByteBuffer \ r;
            ByteBuffer(allocate(capacity))
        })

    pub def clear!(bb: ByteBuffer[r]): Unit \ r =
        import java.nio.ByteBuffer.clear(): ##java.nio.ByteBuffer \ r;
        let ByteBuffer(bb1) = bb;
        clear(bb1);
        ()

    pub def flip!(bb: ByteBuffer[r]): Unit \ r =
        import java.nio.ByteBuffer.flip(): ##java.nio.ByteBuffer \ r;
        let ByteBuffer(bb1) = bb;
        flip(bb1);
        ()

    pub def getByteOrder(bb: ByteBuffer[r]): ByteOrder \ r =
        import java.nio.ByteBuffer.order(): ##java.nio.ByteOrder \ r;
        let ByteBuffer(bb1) = bb;
        order(bb1) |> Basis.IO.ByteOrder.byteOrderFromJava

    pub def setByteOrder!(bo: ByteOrder, bb: ByteBuffer[r]): Unit \ r =
        import java.nio.ByteBuffer.order(##java.nio.ByteOrder): ##java.nio.ByteBuffer \ r;
        let ByteBuffer(bb1) = bb;
        let nbo = Basis.IO.ByteOrder.byteOrderToJava(bo);
        order(bb1, nbo);
        ()

    pub def get!(bb: ByteBuffer[r]): Result[String, Int8] \ r =
        Result.tryCatch(_ -> {
            import java.nio.ByteBuffer.get(): Int8 \ r;
            let ByteBuffer(bb1) = bb;
            get(bb1)
        })

    pub def getAt(ix: Int32, bb: ByteBuffer[r]): Result[String, Int8] \ r =
        Result.tryCatch(_ -> {
            import java.nio.ByteBuffer.get(Int32): Int8 \ r;
            let ByteBuffer(bb1) = bb;
            get(bb1, ix)
        })

    pub def getChar!(bb: ByteBuffer[r]): Result[String, Char] \ r =
        Result.tryCatch(_ -> {
            import java.nio.ByteBuffer.getChar(): Char \ r;
            let ByteBuffer(bb1) = bb;
            getChar(bb1)
        })

    pub def getCharAt(ix: Int32, bb: ByteBuffer[r]): Result[String, Char] \ r =
        Result.tryCatch(_ -> {
            import java.nio.ByteBuffer.getChar(Int32): Char \ r;
            let ByteBuffer(bb1) = bb;
            getChar(bb1, ix)
        })

}
