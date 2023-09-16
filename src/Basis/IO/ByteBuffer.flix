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

    pub def reset!(bb: ByteBuffer[r]): Unit \ r =
        import java.nio.ByteBuffer.reset(): ##java.nio.ByteBuffer \ r;
        let ByteBuffer(bb1) = bb;
        reset(bb1);
        ()

    pub def rewind!(bb: ByteBuffer[r]): Unit \ r =
        import java.nio.ByteBuffer.rewind(): ##java.nio.ByteBuffer \ r;
        let ByteBuffer(bb1) = bb;
        rewind(bb1);
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

    pub def hasArray(bb: ByteBuffer[r]): Bool \ r =
        import java.nio.ByteBuffer.hasArray(): Bool \ r;
        let ByteBuffer(bb1) = bb;
        hasArray(bb1)


    pub def isDirect(bb: ByteBuffer[r]): Bool \ r =
        import java.nio.ByteBuffer.isDirect(): Bool \ r;
        let ByteBuffer(bb1) = bb;
        isDirect(bb1)

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

    pub def getInt8!(bb: ByteBuffer[r]): Result[String, Int8] \ r =
        Result.tryCatch(_ -> {
            import java.nio.ByteBuffer.get(): Int8 \ r;
            let ByteBuffer(bb1) = bb;
            get(bb1)
        })

    pub def getInt8At(ix: Int32, bb: ByteBuffer[r]): Result[String, Int8] \ r =
        Result.tryCatch(_ -> {
            import java.nio.ByteBuffer.get(Int32): Int8 \ r;
            let ByteBuffer(bb1) = bb;
            get(bb1, ix)
        })

    pub def getInt16!(bb: ByteBuffer[r]): Result[String, Int16] \ r =
        Result.tryCatch(_ -> {
            import java.nio.ByteBuffer.getShort(): Int16 \ r;
            let ByteBuffer(bb1) = bb;
            getShort(bb1)
        })

    pub def getInt16At(ix: Int32, bb: ByteBuffer[r]): Result[String, Int16] \ r =
        Result.tryCatch(_ -> {
            import java.nio.ByteBuffer.getShort(Int32): Int16 \ r;
            let ByteBuffer(bb1) = bb;
            getShort(bb1, ix)
        })

    pub def getInt32!(bb: ByteBuffer[r]): Result[String, Int32] \ r =
        Result.tryCatch(_ -> {
            import java.nio.ByteBuffer.getInt(): Int32 \ r;
            let ByteBuffer(bb1) = bb;
            getInt(bb1)
        })

    pub def getInt32At(ix: Int32, bb: ByteBuffer[r]): Result[String, Int32] \ r =
        Result.tryCatch(_ -> {
            import java.nio.ByteBuffer.getInt(Int32): Int32 \ r;
            let ByteBuffer(bb1) = bb;
            getInt(bb1, ix)
        })

    pub def getInt64!(bb: ByteBuffer[r]): Result[String, Int64] \ r =
        Result.tryCatch(_ -> {
            import java.nio.ByteBuffer.getLong(): Int64 \ r;
            let ByteBuffer(bb1) = bb;
            getLong(bb1)
        })

    pub def getInt64At(ix: Int32, bb: ByteBuffer[r]): Result[String, Int64] \ r =
        Result.tryCatch(_ -> {
            import java.nio.ByteBuffer.getLong(Int32): Int64 \ r;
            let ByteBuffer(bb1) = bb;
            getLong(bb1, ix)
        })


    pub def getFloat32!(bb: ByteBuffer[r]): Result[String, Float32] \ r =
        Result.tryCatch(_ -> {
            import java.nio.ByteBuffer.getFloat(): Float32 \ r;
            let ByteBuffer(bb1) = bb;
            getFloat(bb1)
        })

    pub def getFloat32At(ix: Int32, bb: ByteBuffer[r]): Result[String, Float32] \ r =
        Result.tryCatch(_ -> {
            import java.nio.ByteBuffer.getFloat(Int32): Float32 \ r;
            let ByteBuffer(bb1) = bb;
            getFloat(bb1, ix)
        })

    pub def getFloat64!(bb: ByteBuffer[r]): Result[String, Float64] \ r =
        Result.tryCatch(_ -> {
            import java.nio.ByteBuffer.getDouble(): Float64 \ r;
            let ByteBuffer(bb1) = bb;
            getDouble(bb1)
        })

    pub def getFloat64At(ix: Int32, bb: ByteBuffer[r]): Result[String, Float64] \ r =
        Result.tryCatch(_ -> {
            import java.nio.ByteBuffer.getDouble(Int32): Float64 \ r;
            let ByteBuffer(bb1) = bb;
            getDouble(bb1, ix)
        })

    pub def putChar!(c: Char, bb: ByteBuffer[r]): Result[String, Unit] \ r =
        Result.tryCatch(_ -> {
            import java.nio.ByteBuffer.putChar(Char): ##java.nio.ByteBuffer \ r;
            let ByteBuffer(bb1) = bb;
            discard putChar(bb1, c)
        })

    pub def putCharAt!(ix: Int32, c: Char, bb: ByteBuffer[r]): Result[String, Unit] \ r =
        Result.tryCatch(_ -> {
            import java.nio.ByteBuffer.putChar(Int32, Char): ##java.nio.ByteBuffer  \ r;
            let ByteBuffer(bb1) = bb;
            discard putChar(bb1, ix, c)
        })

    pub def putInt8!(i: Int8, bb: ByteBuffer[r]): Result[String, Unit] \ r =
        Result.tryCatch(_ -> {
            import java.nio.ByteBuffer.put(Int8): ##java.nio.ByteBuffer \ r;
            let ByteBuffer(bb1) = bb;
            discard put(bb1, i)
        })

    pub def putInt8At!(ix: Int32, i: Int8, bb: ByteBuffer[r]): Result[String, Unit] \ r =
        Result.tryCatch(_ -> {
            import java.nio.ByteBuffer.put(Int32, Int8): ##java.nio.ByteBuffer \ r;
            let ByteBuffer(bb1) = bb;
            discard put(bb1, ix, i)
        })

    pub def putInt16!(i: Int16, bb: ByteBuffer[r]): Result[String, Unit] \ r =
        Result.tryCatch(_ -> {
            import java.nio.ByteBuffer.putShort(Int16): ##java.nio.ByteBuffer  \ r;
            let ByteBuffer(bb1) = bb;
            discard putShort(bb1, i)
        })

    pub def putInt16At(ix: Int32, i: Int16, bb: ByteBuffer[r]): Result[String, Unit] \ r =
        Result.tryCatch(_ -> {
            import java.nio.ByteBuffer.putShort(Int32, Int16): ##java.nio.ByteBuffer \ r;
            let ByteBuffer(bb1) = bb;
            discard putShort(bb1, ix, i)
        })

    pub def putInt32!(i: Int32, bb: ByteBuffer[r]): Result[String, Unit] \ r =
        Result.tryCatch(_ -> {
            import java.nio.ByteBuffer.putInt(Int32): ##java.nio.ByteBuffer  \ r;
            let ByteBuffer(bb1) = bb;
            discard putInt(bb1, i)
        })

    pub def putInt32At(ix: Int32, i: Int32, bb: ByteBuffer[r]): Result[String, Unit] \ r =
        Result.tryCatch(_ -> {
            import java.nio.ByteBuffer.putInt(Int32, Int32): ##java.nio.ByteBuffer  \ r;
            let ByteBuffer(bb1) = bb;
            discard putInt(bb1, ix, i)
        })

    pub def putInt64!(i: Int64, bb: ByteBuffer[r]): Result[String, Unit] \ r =
        Result.tryCatch(_ -> {
            import java.nio.ByteBuffer.putLong(Int64): ##java.nio.ByteBuffer  \ r;
            let ByteBuffer(bb1) = bb;
            discard putLong(bb1, i)
        })

    pub def putInt64At(ix: Int32, i: Int64, bb: ByteBuffer[r]): Result[String, Unit] \ r =
        Result.tryCatch(_ -> {
            import java.nio.ByteBuffer.putLong(Int32, Int64): ##java.nio.ByteBuffer  \ r;
            let ByteBuffer(bb1) = bb;
            discard putLong(bb1, ix, i)
        })


    pub def putFloat32!(d: Float32, bb: ByteBuffer[r]): Result[String, Unit] \ r =
        Result.tryCatch(_ -> {
            import java.nio.ByteBuffer.putFloat(Float32): ##java.nio.ByteBuffer  \ r;
            let ByteBuffer(bb1) = bb;
            discard putFloat(bb1, d)
        })

    pub def putFloat32At(ix: Int32, d: Float32, bb: ByteBuffer[r]): Result[String, Unit] \ r =
        Result.tryCatch(_ -> {
            import java.nio.ByteBuffer.putFloat(Int32, Float32): ##java.nio.ByteBuffer  \ r;
            let ByteBuffer(bb1) = bb;
            discard putFloat(bb1, ix, d)
        })

    pub def putFloat64!(d: Float64, bb: ByteBuffer[r]): Result[String, Unit] \ r =
        Result.tryCatch(_ -> {
            import java.nio.ByteBuffer.putDouble(Float64): ##java.nio.ByteBuffer  \ r;
            let ByteBuffer(bb1) = bb;
            discard putDouble(bb1, d)
        })

    pub def putFloat64At!(ix: Int32, d: Float64, bb: ByteBuffer[r]): Result[String, Unit] \ r =
        Result.tryCatch(_ -> {
            import java.nio.ByteBuffer.putDouble(Int32, Float64): ##java.nio.ByteBuffer \ r;
            let ByteBuffer(bb1) = bb;
            discard putDouble(bb1, ix, d)
        })

}
