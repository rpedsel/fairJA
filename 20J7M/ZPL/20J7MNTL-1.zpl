set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.8997, <2> 19.8721, <3> 29.5818, <4> 32.9661, <5> 23.3612, <6> 15.503, <7> 21.8114, <8> 29.3082, <9> 34.9432, <10> 30.35, <11> 18.4659, <12> 19.6949, <13> 25.599, <14> 24.718, <15> 24.6865, <16> 24.2779, <17> 23.4006, <18> 22.1504, <19> 22.5998, <20> 20.1664;
param workload[JOB] := <1> 21.8997, <2> 19.8721, <3> 29.5818, <4> 32.9661, <5> 23.3612, <6> 15.503, <7> 21.8114, <8> 29.3082, <9> 34.9432, <10> 30.35, <11> 18.4659, <12> 19.6949, <13> 25.599, <14> 24.718, <15> 24.6865, <16> 24.2779, <17> 23.4006, <18> 22.1504, <19> 22.5998, <20> 20.1664;
param capacity[MACHINE] := <1> 52.0025, <2> 52.0025, <3> 52.0025, <4> 52.0025, <5> 52.0025, <6> 52.0025, <7> 52.0025;

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
