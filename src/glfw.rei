type window;

let print_hello: unit => unit;
let glfwInit: unit => bool;
let glfwCreateWindow: (int, int, string) => window;
let glfwMakeContextCurrent: window => unit;
let glfwWindowShouldClose: window => bool;
let glfwPollEvents: unit => unit;
let glfwTerminate: unit => unit;
let glfwSwapBuffers: window => unit;
let printFrameBufferSize: window => unit;

/* GL */

let glClearColor: (float, float, float, float) => unit;
let glClearDepth: float => unit;

type shader;
type shaderType =
  | GL_VERTEX_SHADER
  | GL_FRAGMENT_SHADER;

let glCreateShader: shaderType => shader;
let glShaderSource: (shader, string) => unit;
let glCompileShader: shader => unit;
let glDeleteShader: shader => unit;
/*TODO: Remove*/
let glGetShaderIsCompiled: shader => bool;

type enableOptions =
  | GL_DEPTH_TEST;

let glEnable: enableOptions => unit;

type depthFunctions =
  | GL_LEQUAL;

let glDepthFunc: depthFunctions => unit;

type program;

let glCreateProgram: unit => program;
let glAttachShader: (program, shader) => unit;
let glLinkProgram: program => unit;
let glUseProgram: program => unit;

type attribLocation;
let glGetAttribLocation: (program, string) => attribLocation;

type uniformLocation;
let glGetUniformLocation: (program, string) => uniformLocation;
let glUniformMatrix4fv: uniformLocation => unit;

type bufferType =
  | GL_ARRAY_BUFFER;

type glType =
  | GL_FLOAT;

let glVertexAttribPointer: (attribLocation, int, glType, bool) => unit;
let glEnableVertexAttribArray: attribLocation => unit;

type buffer;
let glCreateBuffer: unit => buffer;
let glBindBuffer: (bufferType, buffer) => unit;
let glUnbindBuffer: bufferType => unit;

type drawType =
  | GL_STATIC_DRAW;

let glBufferData:
  (
    bufferType,
    Bigarray.Array1.t(float, Bigarray.float32_elt, Bigarray.c_layout),
    drawType
  ) =>
  unit;

type drawMode =
  | GL_TRIANGLES;

let glDrawArrays: (drawMode, int, int) => unit;
