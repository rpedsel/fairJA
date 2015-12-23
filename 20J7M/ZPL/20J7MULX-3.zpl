set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 44.2637, <2> 6.5965, <3> 22.437, <4> 27.8858, <5> 1.1579, <6> 32.4916, <7> 28.332, <8> 42.35, <9> 29.0003, <10> 22.3791, <11> 49.6913, <12> 2.5518, <13> 46.5676, <14> 19.6313, <15> 0.3503, <16> 30.8162, <17> 26.7829, <18> 1.3857, <19> 42.262, <20> 49.2493;
param workload[JOB] := <1> 6.6531, <2> 2.5684, <3> 4.7368, <4> 5.2807, <5> 1.0761, <6> 5.7001, <7> 5.3228, <8> 6.5077, <9> 5.3852, <10> 4.7307, <11> 7.0492, <12> 1.5974, <13> 6.824, <14> 4.4307, <15> 0.5919, <16> 5.5512, <17> 5.1752, <18> 1.1772, <19> 6.5009, <20> 7.0178;
param capacity[MACHINE] := <1> 13.411, <2> 13.411, <3> 13.411, <4> 13.411, <5> 13.411, <6> 13.411, <7> 13.411;

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
