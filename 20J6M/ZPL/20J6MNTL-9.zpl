set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.6727, <2> 29.9177, <3> 23.7707, <4> 25.5616, <5> 34.411, <6> 28.6044, <7> 23.8349, <8> 23.6798, <9> 20.8413, <10> 23.9012, <11> 21.766, <12> 28.3691, <13> 21.7166, <14> 19.2166, <15> 25.0703, <16> 23.2477, <17> 25.4341, <18> 31.3418, <19> 30.3041, <20> 26.709;
param workload[JOB] := <1> 24.6727, <2> 29.9177, <3> 23.7707, <4> 25.5616, <5> 34.411, <6> 28.6044, <7> 23.8349, <8> 23.6798, <9> 20.8413, <10> 23.9012, <11> 21.766, <12> 28.3691, <13> 21.7166, <14> 19.2166, <15> 25.0703, <16> 23.2477, <17> 25.4341, <18> 31.3418, <19> 30.3041, <20> 26.709;
param capacity[MACHINE] := <1> 64.0463, <2> 64.0463, <3> 64.0463, <4> 64.0463, <5> 64.0463, <6> 64.0463;

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
