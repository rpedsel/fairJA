set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 18.5546, <2> 35.8606, <3> 3.9449, <4> 29.3857, <5> 34.412, <6> 20.6979, <7> 12.9075, <8> 30.6216, <9> 30.7617, <10> 34.0756, <11> 40.115, <12> 17.4729, <13> 39.3076, <14> 43.1029, <15> 34.4727, <16> 41.6879, <17> 23.3803, <18> 22.4229, <19> 17.5379, <20> 22.8323;
param workload[JOB] := <1> 4.3075, <2> 5.9884, <3> 1.9862, <4> 5.4209, <5> 5.8662, <6> 4.5495, <7> 3.5927, <8> 5.5337, <9> 5.5463, <10> 5.8374, <11> 6.3336, <12> 4.1801, <13> 6.2696, <14> 6.5653, <15> 5.8713, <16> 6.4566, <17> 4.8353, <18> 4.7353, <19> 4.1878, <20> 4.7783;
param capacity[MACHINE] := <1> 14.6917, <2> 14.6917, <3> 14.6917, <4> 14.6917, <5> 14.6917, <6> 14.6917, <7> 14.6917;

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
