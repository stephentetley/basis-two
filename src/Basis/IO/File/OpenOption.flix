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


mod Basis.IO.File {

    ///
    /// Represents an OpenOption.
    pub enum OpenOption(##java.nio.file.OpenOption)

}

mod Basis.IO.File.OpenOption {

    pub def nofollowLinks(): OpenOption = 
        Basis.IO.File.LinkOption.asOpenOption(Basis.IO.File.LinkOption.NofollowLinks)

    pub def append(): OpenOption = 
        Basis.IO.File.StandardOpenOption.asOpenOption(Basis.IO.File.StandardOpenOption.Append)

    pub def create(): OpenOption = 
        Basis.IO.File.StandardOpenOption.asOpenOption(Basis.IO.File.StandardOpenOption.Create)
        
    pub def createNew(): OpenOption = 
        Basis.IO.File.StandardOpenOption.asOpenOption(Basis.IO.File.StandardOpenOption.CreateNew)
        
    pub def deleteOnClose(): OpenOption = 
        Basis.IO.File.StandardOpenOption.asOpenOption(Basis.IO.File.StandardOpenOption.DeleteOnClose)

    pub def dsync(): OpenOption =         
        Basis.IO.File.StandardOpenOption.asOpenOption(Basis.IO.File.StandardOpenOption.Dsync)

    pub def read(): OpenOption =         
        Basis.IO.File.StandardOpenOption.asOpenOption(Basis.IO.File.StandardOpenOption.Read)

    pub def sparse(): OpenOption =         
        Basis.IO.File.StandardOpenOption.asOpenOption(Basis.IO.File.StandardOpenOption.Sparse)

    pub def sync(): OpenOption =         
        Basis.IO.File.StandardOpenOption.asOpenOption(Basis.IO.File.StandardOpenOption.Sync)
        
    pub def truncateExisting(): OpenOption = 
        Basis.IO.File.StandardOpenOption.asOpenOption(Basis.IO.File.StandardOpenOption.TruncateExisting)

    pub def write(): OpenOption =         
        Basis.IO.File.StandardOpenOption.asOpenOption(Basis.IO.File.StandardOpenOption.Write)

}
