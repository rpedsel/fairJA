set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 37.586, <2> 30.4186, <3> 26.3961, <4> 28.7252, <5> 19.4817, <6> 22.1088, <7> 21.7493, <8> 22.4737, <9> 19.5704, <10> 19.2448, <11> 17.8948, <12> 23.293, <13> 23.7674, <14> 32.678, <15> 29.6972, <16> 27.4296, <17> 28.4021, <18> 23.9634, <19> 26.709, <20> 24.4209;
param workload[JOB] := <1> 6.1307, <2> 5.5153, <3> 5.1377, <4> 5.3596, <5> 4.4138, <6> 4.702, <7> 4.6636, <8> 4.7406, <9> 4.4238, <10> 4.3869, <11> 4.2302, <12> 4.8263, <13> 4.8752, <14> 5.7165, <15> 5.4495, <16> 5.2373, <17> 5.3294, <18> 4.8952, <19> 5.1681, <20> 4.9418;
param capacity[MACHINE] := <1> 14.3062, <2> 14.3062, <3> 14.3062, <4> 14.3062, <5> 14.3062, <6> 14.3062, <7> 14.3062;

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
