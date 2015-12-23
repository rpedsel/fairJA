set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.8165, <2> 3.8701, <3> 27.7893, <4> 25.1159, <5> 38.3935, <6> 45.8809, <7> 7.7869, <8> 14.6154, <9> 22.1114, <10> 36.2977, <11> 25.2387, <12> 5.498, <13> 28.5457, <14> 16.5937, <15> 33.1273, <16> 47.6843, <17> 27.419, <18> 31.8233, <19> 41.9892, <20> 11.2613;
param workload[JOB] := <1> 5.3681, <2> 1.9673, <3> 5.2716, <4> 5.0116, <5> 6.1962, <6> 6.7735, <7> 2.7905, <8> 3.823, <9> 4.7023, <10> 6.0248, <11> 5.0238, <12> 2.3448, <13> 5.3428, <14> 4.0735, <15> 5.7556, <16> 6.9054, <17> 5.2363, <18> 5.6412, <19> 6.4799, <20> 3.3558;
param capacity[MACHINE] := <1> 14.0126, <2> 14.0126, <3> 14.0126, <4> 14.0126, <5> 14.0126, <6> 14.0126, <7> 14.0126;

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
