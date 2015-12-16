set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 6.1855, <2> 19.0727, <3> 46.5027, <4> 48.5813, <5> 12.7712, <6> 38.6749, <7> 9.8638, <8> 4.7381, <9> 39.3225, <10> 38.6094, <11> 3.4584, <12> 18.1914, <13> 21.3505, <14> 37.4498, <15> 34.0804, <16> 43.5172, <17> 45.1301, <18> 23.5362, <19> 8.7966, <20> 23.2605;
param workload[JOB] := <1> 6.1855, <2> 19.0727, <3> 46.5027, <4> 48.5813, <5> 12.7712, <6> 38.6749, <7> 9.8638, <8> 4.7381, <9> 39.3225, <10> 38.6094, <11> 3.4584, <12> 18.1914, <13> 21.3505, <14> 37.4498, <15> 34.0804, <16> 43.5172, <17> 45.1301, <18> 23.5362, <19> 8.7966, <20> 23.2605;
param capacity[MACHINE] := <1> 87.1822, <2> 87.1822, <3> 87.1822, <4> 87.1822, <5> 87.1822, <6> 87.1822;

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
