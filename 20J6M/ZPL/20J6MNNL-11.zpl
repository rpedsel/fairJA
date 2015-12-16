set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.9932, <2> 26.046, <3> 29.7749, <4> 27.1137, <5> 27.594, <6> 25.7425, <7> 22.9727, <8> 27.537, <9> 33.2189, <10> 14.5347, <11> 31.166, <12> 28.8446, <13> 20.6725, <14> 36.2979, <15> 33.9065, <16> 21.8671, <17> 24.8147, <18> 18.8425, <19> 26.8922, <20> 27.0941;
param workload[JOB] := <1> 27.9932, <2> 26.046, <3> 29.7749, <4> 27.1137, <5> 27.594, <6> 25.7425, <7> 22.9727, <8> 27.537, <9> 33.2189, <10> 14.5347, <11> 31.166, <12> 28.8446, <13> 20.6725, <14> 36.2979, <15> 33.9065, <16> 21.8671, <17> 24.8147, <18> 18.8425, <19> 26.8922, <20> 27.0941;
param capacity[MACHINE] := <1> 532.9257, <2> 532.9257, <3> 532.9257, <4> 532.9257, <5> 532.9257, <6> 532.9257;

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
