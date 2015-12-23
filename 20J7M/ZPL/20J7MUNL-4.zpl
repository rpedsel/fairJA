set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.1931, <2> 23.3138, <3> 4.9997, <4> 5.9276, <5> 42.5934, <6> 48.9392, <7> 25.9697, <8> 24.3203, <9> 21.967, <10> 48.752, <11> 26.5299, <12> 21.3322, <13> 45.3541, <14> 8.38, <15> 30.485, <16> 31.4262, <17> 19.353, <18> 4.9702, <19> 46.5088, <20> 28.1278;
param workload[JOB] := <1> 25.1931, <2> 23.3138, <3> 4.9997, <4> 5.9276, <5> 42.5934, <6> 48.9392, <7> 25.9697, <8> 24.3203, <9> 21.967, <10> 48.752, <11> 26.5299, <12> 21.3322, <13> 45.3541, <14> 8.38, <15> 30.485, <16> 31.4262, <17> 19.353, <18> 4.9702, <19> 46.5088, <20> 28.1278;
param capacity[MACHINE] := <1> 534.443, <2> 534.443, <3> 534.443, <4> 534.443, <5> 534.443, <6> 534.443, <7> 534.443;

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
