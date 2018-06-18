defmodule CoinSearcher do
  @coin_names "gbyte, gno, sls, xzc, zen, fct, qtum, block, nmr, part, lun, cloak, rads, bnt, mona, ant, salt, kore, emc, sphr, shift, ion, eng, via, exp, iop, nxs, ubq, dyn, game, swt, pro, rlc, pay, zrx, tx, nav, qrl, excl, sib, adx, tusd, dct, poly, lrc, unb, bsd, edg, vrc, wings, nbt, bcpt, synx, dmt, sys, bat, cvc, gup, xel, wax, lbc, blk, meme, amp, ukg, ftc, nxt, vib, up, ok, hmq, ptoy, mana, rcn, mue, dnt, rvr, cfi, xvg, bay, adt, vee, dgb, burst, xdn, bitb, rdd, doge, iota, ven, nano, bcn, ae, wan, zil, bts, btm, bcd, ppt, btcp, mkr, rhoc, hsr, dgd, iost, wtc, aion, xin, elf, mith, nas, gas, knc, wicc, sub, ctxc, btcd, qash, cnx, cennz, veri, drgn, ethos, gxs, dcn, fsn, fun, npxs, etn, ela, nebl, link, ncash, cmt, bft, kin, req, man, r, act, maid, bto, cnd, dbc, icn, nuls, gnx, sky, tnb, payx, poa, ruff, poe, abt, cpx, qsp, smart, enj, amb, btx, agi, san, dent, rdn, ddd, smt, bos, blz, drop, rpx, gtc, tpay, lcc, dtr, hpb, theta, tomo, ppp, med, dew, snm, lend, plr, sphtx, dta, bco, soc, gvt, cs, itc, iht, auto, zco, tky, note, ost, ink, zcl, ast, bix, xas, nanj, edo, brd, eosdac"
  @chat_id Application.get_env(:certificate, :telegram_chat_id)

  def upbit_number_run(coin_number) do
    %{:status_code => code} =
      HTTPoison.get!(
        "https://static.upbit.com/upbit-pc/pc_coin_open_popup_images/popup_market_#{coin_number}.png"
      )

    case code do
      200 ->
        Nadia.send_message(
          @chat_id,
          "#{coin_number}가 상장했습니다: https://static.upbit.com/upbit-pc/pc_coin_open_popup_images/popup_market_#{
            coin_number
          }.png"
        )

      _ ->
        :ok
    end

    Process.sleep(30_000)

    upbit_number_run(coin_number)
  end

  def upbit_name_run() do
    coins = String.split(@coin_names, ", ")

    Enum.each(coins, fn coin_name ->
      %{:status_code => code} =
        HTTPoison.get!("https://static.upbit.com/marketing/#{coin_name}_listing.png")

      case code do
        200 ->
          Nadia.send_message(
            @chat_id,
            "#{coin_name}이 상장되었습니다. https://static.upbit.com/marketing/#{coin_name}_listing.png"
          )

        _ ->
          :ok
      end
    end)


    Process.sleep(30_000)

    upbit_name_run()
  end
end
