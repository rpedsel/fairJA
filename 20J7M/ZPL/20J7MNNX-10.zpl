set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.177, <2> 24.5357, <3> 25.9796, <4> 26.4437, <5> 21.5888, <6> 17.8523, <7> 27.1552, <8> 28.1897, <9> 19.0844, <10> 34.3169, <11> 17.2983, <12> 20.1694, <13> 24.2504, <14> 21.1463, <15> 31.7076, <16> 27.3638, <17> 41.614, <18> 21.4396, <19> 30.7369, <20> 23.3482;
param workload[JOB] := <1> 4.7092, <2> 4.9534, <3> 5.097, <4> 5.1423, <5> 4.6464, <6> 4.2252, <7> 5.2111, <8> 5.3094, <9> 4.3686, <10> 5.8581, <11> 4.1591, <12> 4.491, <13> 4.9245, <14> 4.5985, <15> 5.631, <16> 5.231, <17> 6.4509, <18> 4.6303, <19> 5.5441, <20> 4.832;
param capacity[MACHINE] := <1> 100.0131, <2> 100.0131, <3> 100.0131, <4> 100.0131, <5> 100.0131, <6> 100.0131, <7> 100.0131;

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
