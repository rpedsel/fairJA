set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 19.1726, <2> 29.436, <3> 21.3398, <4> 33.9976, <5> 33.9774, <6> 32.2653, <7> 16.3509, <8> 25.6935, <9> 23.1847, <10> 16.591, <11> 16.4867, <12> 16.4087, <13> 19.0872, <14> 21.5694, <15> 25.5137, <16> 24.446, <17> 20.3116, <18> 28.1578, <19> 23.3208, <20> 24.4843;
param workload[JOB] := <1> 4.3787, <2> 5.4255, <3> 4.6195, <4> 5.8307, <5> 5.829, <6> 5.6803, <7> 4.0436, <8> 5.0689, <9> 4.815, <10> 4.0732, <11> 4.0604, <12> 4.0508, <13> 4.3689, <14> 4.6443, <15> 5.0511, <16> 4.9443, <17> 4.5068, <18> 5.3064, <19> 4.8292, <20> 4.9482;
param capacity[MACHINE] := <1> 10.3366, <2> 10.3366, <3> 10.3366, <4> 10.3366, <5> 10.3366, <6> 10.3366, <7> 10.3366;

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
