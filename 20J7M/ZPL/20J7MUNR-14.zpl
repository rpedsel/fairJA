set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 45.1534, <2> 15.5869, <3> 49.8163, <4> 27.0811, <5> 10.1816, <6> 1.2238, <7> 32.7566, <8> 22.9, <9> 28.2446, <10> 8.1364, <11> 10.9379, <12> 5.7933, <13> 12.1148, <14> 24.1107, <15> 15.9744, <16> 37.3637, <17> 5.8281, <18> 41.213, <19> 3.9793, <20> 49.4294;
param workload[JOB] := <1> 9.3008, <2> 27.2853, <3> 11.1887, <4> 17.6461, <5> 14.194, <6> 42.4361, <7> 22.5161, <8> 33.4393, <9> 19.091, <10> 41.4299, <11> 37.6229, <12> 1.9834, <13> 20.3914, <14> 8.1532, <15> 5.461, <16> 22.0839, <17> 23.5969, <18> 25.6655, <19> 8.0216, <20> 46.4371;
param capacity[MACHINE] := <1> 437.9442, <2> 437.9442, <3> 437.9442, <4> 437.9442, <5> 437.9442, <6> 437.9442, <7> 437.9442;

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
