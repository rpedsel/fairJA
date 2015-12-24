set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 31.373, <2> 20.2193, <3> 23.9655, <4> 24.5005, <5> 21.8807, <6> 28.046, <7> 31.5371, <8> 22.1722, <9> 25.7374, <10> 21.0508, <11> 32.5265, <12> 23.5395, <13> 27.2863, <14> 25.4699, <15> 26.4152, <16> 24.7703, <17> 27.9438, <18> 29.4172, <19> 32.1119, <20> 31.2599;
param workload[JOB] := <1> 5.6012, <2> 4.4966, <3> 4.8955, <4> 4.9498, <5> 4.6777, <6> 5.2958, <7> 5.6158, <8> 4.7087, <9> 5.0732, <10> 4.5881, <11> 5.7032, <12> 4.8518, <13> 5.2236, <14> 5.0468, <15> 5.1396, <16> 4.977, <17> 5.2862, <18> 5.4238, <19> 5.6667, <20> 5.5911;
param capacity[MACHINE] := <1> 14.6875, <2> 14.6875, <3> 14.6875, <4> 14.6875, <5> 14.6875, <6> 14.6875, <7> 14.6875;

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
