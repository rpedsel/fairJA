set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.2355, <2> 21.3069, <3> 29.3875, <4> 26.3298, <5> 28.4842, <6> 32.2709, <7> 26.2429, <8> 28.2488, <9> 27.9581, <10> 18.2299, <11> 25.2542, <12> 22.4497, <13> 30.003, <14> 28.4909, <15> 21.7809, <16> 25.1856, <17> 26.5029, <18> 27.6594, <19> 21.4108, <20> 31.6344;
param workload[JOB] := <1> 5.2188, <2> 4.6159, <3> 5.421, <4> 5.1313, <5> 5.3371, <6> 5.6807, <7> 5.1228, <8> 5.315, <9> 5.2875, <10> 4.2696, <11> 5.0254, <12> 4.7381, <13> 5.4775, <14> 5.3377, <15> 4.667, <16> 5.0185, <17> 5.1481, <18> 5.2592, <19> 4.6272, <20> 5.6244;
param capacity[MACHINE] := <1> 14.6175, <2> 14.6175, <3> 14.6175, <4> 14.6175, <5> 14.6175, <6> 14.6175, <7> 14.6175;

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
