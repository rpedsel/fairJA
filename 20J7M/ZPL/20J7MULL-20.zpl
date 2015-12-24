set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 5.7026, <2> 40.8815, <3> 29.1744, <4> 7.7638, <5> 15.2283, <6> 25.3149, <7> 22.9157, <8> 22.8357, <9> 31.1949, <10> 32.3537, <11> 41.4418, <12> 27.6217, <13> 4.6394, <14> 3.3549, <15> 11.7101, <16> 12.6789, <17> 26.3849, <18> 3.2636, <19> 5.2558, <20> 31.0005;
param workload[JOB] := <1> 5.7026, <2> 40.8815, <3> 29.1744, <4> 7.7638, <5> 15.2283, <6> 25.3149, <7> 22.9157, <8> 22.8357, <9> 31.1949, <10> 32.3537, <11> 41.4418, <12> 27.6217, <13> 4.6394, <14> 3.3549, <15> 11.7101, <16> 12.6789, <17> 26.3849, <18> 3.2636, <19> 5.2558, <20> 31.0005;
param capacity[MACHINE] := <1> 57.2453, <2> 57.2453, <3> 57.2453, <4> 57.2453, <5> 57.2453, <6> 57.2453, <7> 57.2453;

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
