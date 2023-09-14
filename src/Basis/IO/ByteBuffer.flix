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

mod Basis.IO.ButeBuffer {


    use Basis.IO.ByteBuffer
    use Basis.IO.ByteBuffer.{ByteBuffer}


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
}
