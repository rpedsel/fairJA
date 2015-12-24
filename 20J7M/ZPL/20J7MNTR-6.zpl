set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.5756, <2> 24.7367, <3> 16.7283, <4> 32.7133, <5> 20.4349, <6> 16.9872, <7> 22.2173, <8> 26.9994, <9> 27.34, <10> 15.7531, <11> 32.555, <12> 25.7852, <13> 26.0969, <14> 24.326, <15> 24.7368, <16> 25.2032, <17> 25.4634, <18> 31.3093, <19> 23.7628, <20> 23.4725;
param workload[JOB] := <1> 16.7213, <2> 6.1303, <3> 19.9869, <4> 44.8154, <5> 49.0317, <6> 19.9004, <7> 23.5833, <8> 31.0266, <9> 14.5756, <10> 46.9541, <11> 14.2891, <12> 31.156, <13> 36.5137, <14> 48.342, <15> 26.8627, <16> 9.7435, <17> 3.4115, <18> 2.6863, <19> 19.3194, <20> 1.2894;
param capacity[MACHINE] := <1> 49.9649, <2> 49.9649, <3> 49.9649, <4> 49.9649, <5> 49.9649, <6> 49.9649, <7> 49.9649;

var x[JM];
var z;
maximize minBenefit: z;
subto Z:
   forall <m> in MACHINE do
      sum <j> in JOB : benefit[j] * x[j,m] >= z;
subto K:
   forall <m> in MACHINE do
      sum <j> in JOB : workload[j] * x[j,m] <= capacity[m];
subto X:
   forall <j> in JOB do
      sum <m> in MACHINE : x[j,m] <= 1;
subto A:
   forall <j,m> in JM do
      x[j,m] >= 0;
