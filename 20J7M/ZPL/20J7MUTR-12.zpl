set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.4495, <2> 21.7627, <3> 31.4335, <4> 12.3368, <5> 39.7228, <6> 14.9437, <7> 17.3257, <8> 45.9964, <9> 6.5671, <10> 20.3028, <11> 12.6164, <12> 9.788, <13> 47.4753, <14> 8.9424, <15> 26.4196, <16> 37.3431, <17> 21.4349, <18> 3.779, <19> 2.0389, <20> 8.2414;
param workload[JOB] := <1> 5.988, <2> 28.2607, <3> 40.62, <4> 42.2122, <5> 22.7133, <6> 44.1638, <7> 4.2192, <8> 42.4918, <9> 6.6424, <10> 49.1386, <11> 25.3692, <12> 25.6069, <13> 29.7366, <14> 5.7841, <15> 28.0023, <16> 1.3956, <17> 7.9427, <18> 18.4704, <19> 21.2539, <20> 16.8471;
param capacity[MACHINE] := <1> 50.0206, <2> 50.0206, <3> 50.0206, <4> 50.0206, <5> 50.0206, <6> 50.0206, <7> 50.0206;

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
