set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 31.0346, <2> 2.5842, <3> 5.9697, <4> 36.159, <5> 7.7256, <6> 48.7878, <7> 6.0526, <8> 47.901, <9> 29.3231, <10> 23.4361, <11> 45.14, <12> 29.7203, <13> 36.2466, <14> 24.8234, <15> 23.9851, <16> 7.9191, <17> 13.0065, <18> 18.6952, <19> 39.909, <20> 35.6346;
param workload[JOB] := <1> 5.5709, <2> 1.6075, <3> 2.4433, <4> 6.0132, <5> 2.7795, <6> 6.9848, <7> 2.4602, <8> 6.9211, <9> 5.4151, <10> 4.8411, <11> 6.7186, <12> 5.4516, <13> 6.0205, <14> 4.9823, <15> 4.8975, <16> 2.8141, <17> 3.6065, <18> 4.3238, <19> 6.3174, <20> 5.9695;
param capacity[MACHINE] := <1> 96.1385, <2> 96.1385, <3> 96.1385, <4> 96.1385, <5> 96.1385, <6> 96.1385, <7> 96.1385;

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
