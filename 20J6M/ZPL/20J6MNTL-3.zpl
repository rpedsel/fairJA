set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.4464, <2> 24.8006, <3> 22.2638, <4> 27.4667, <5> 24.5843, <6> 30.0566, <7> 17.3635, <8> 27.7001, <9> 33.536, <10> 27.1369, <11> 32.7509, <12> 26.9632, <13> 31.6363, <14> 21.9702, <15> 27.0038, <16> 33.3319, <17> 22.7087, <18> 19.9943, <19> 17.5467, <20> 28.0712;
param workload[JOB] := <1> 25.4464, <2> 24.8006, <3> 22.2638, <4> 27.4667, <5> 24.5843, <6> 30.0566, <7> 17.3635, <8> 27.7001, <9> 33.536, <10> 27.1369, <11> 32.7509, <12> 26.9632, <13> 31.6363, <14> 21.9702, <15> 27.0038, <16> 33.3319, <17> 22.7087, <18> 19.9943, <19> 17.5467, <20> 28.0712;
param capacity[MACHINE] := <1> 65.2915, <2> 65.2915, <3> 65.2915, <4> 65.2915, <5> 65.2915, <6> 65.2915;

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
